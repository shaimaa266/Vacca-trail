import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../display view/breeding_system/presentation/manage/breeding_provider.dart';
import '../../../../core/widgets/first_row_title.dart';
import '../shared/custom_floating_button.dart';
import 'container breeding.dart';
import 'create system/add system.dart';

class BreedingDoctorPage extends StatelessWidget {
  BreedingDoctorPage({super.key, this.initialBreedingSystemId});
  final int? initialBreedingSystemId;

  final TextEditingController controller = TextEditingController();
  Future<void> _fetchInitialData(BuildContext context) async {
    final breedingProvider =
        Provider.of<BreedingProvider>(context, listen: false);
    await breedingProvider.fetchAllBreedingSystems();

    if (initialBreedingSystemId != null) {
      final initialIndex = breedingProvider.breedingSystems.indexWhere(
        (system) => system.id == initialBreedingSystemId,
      );
      if (initialIndex != 0) {
        breedingProvider.setCurrentPage(initialIndex);

        breedingProvider.pageController.animateToPage(
          initialIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchInitialData(context);
    });
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Consumer<BreedingProvider>(
              builder: (context, breedingProvider, child) {
            if (breedingProvider.isLoading) {
              return Center(
                child: SpinKitFoldingCube(
                  color: Colors.green.shade700,
                  size: 70,
                ),
              );
            } else if (breedingProvider.errorMessage != null) {
              return Center(
                child: Text('Error: ${breedingProvider.errorMessage}'),
              );
            } else {
              final breedingSystem = breedingProvider
                  .breedingSystems[breedingProvider.currentPage];
              return Padding(
                padding: const EdgeInsets.only(
                  top: 36.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleRow(textTitle: "Breeding systems "),
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
                    BreedingContainer(
                      breedingSystemId: breedingSystem.id,
                      imagePath:
                          breedingProvider.images[breedingProvider.currentPage],
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddBreedSystem(),
            ),
          );
        },
      ),
    );
  }
}
