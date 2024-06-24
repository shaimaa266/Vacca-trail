import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/core/widgets/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../display view/activity_system/presentation/control/activity_system_provider.dart';
import '../shared/custom_floating_button.dart';

import 'activity sys container.dart';
import 'add.dart';

class ActivitySysDoctorPage extends StatelessWidget {
  final int? initialSystemId;
  ActivitySysDoctorPage({super.key, this.initialSystemId});
  final dynamic route = AddActSystem();
  final TextEditingController controller = TextEditingController();

  Future<void> fetchInitialData(BuildContext context) async {
    final activitySystemsProvider =
        Provider.of<ActivitySystemsProvider>(context, listen: false);
    await activitySystemsProvider.fetchAllActivitySystems();

    if (initialSystemId != null) {
      final initialIndex = activitySystemsProvider.filteredSystems.indexWhere(
        (system) => system.id == initialSystemId,
      );
      if (initialIndex != -1) {
        activitySystemsProvider.setCurrentPage(initialIndex);
        activitySystemsProvider.pageController.animateToPage(
          initialIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchInitialData(context);
    });
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Consumer<ActivitySystemsProvider>(
              builder: (context, activitySystemsProvider, child) {
            if (activitySystemsProvider.isLoading) {
              return Center(
                child: SpinKitFoldingCube(
                  color: Colors.green.shade700,
                  size: 70,
                ),
              );
            } else if (activitySystemsProvider.errorMessage != null) {
              return Center(
                child: Text('Error: ${activitySystemsProvider.errorMessage}'),
              );
            } else {
              final activitySystem = activitySystemsProvider.filteredSystems[activitySystemsProvider.currentPage];
              return Padding(
                padding: const EdgeInsets.only(
                  top: 36.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleRow(textTitle: 'Activity System'),
                    const SizedBox(
                      height: 15,
                    ),
                    SearchBarCustom(
                        controller: controller,
                        onTap: () {},
                        onPressedSearch: () {},
                        w: 555,
                        h: 50,
                        keyboardType: TextInputType.text,
                        hintText: "Search..."),
                    ActivitySysContainer(activitySystemId:activitySystem.id,imagePath: activitySystemsProvider.images[activitySystemsProvider.currentPage],),
                  ],
                ),
              );
            }
          }),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
      floatingActionButton: CustomFloatingButton(
        onPressed: (){},
      ),
    );
  }
}
