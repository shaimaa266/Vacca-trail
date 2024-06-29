import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/core/widgets/search_bar.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/control/treatment_provider.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/add%20treatment.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/all%20treatment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';

import '../../../shared/custom_floating_button.dart';
import '../../../shared/doctor_nav_bar.dart';

class EmptyTreatments extends StatelessWidget {
  EmptyTreatments({super.key, required this.id});
  final int id;

  final TextEditingController controller = TextEditingController();
  void fetchInitialData(BuildContext context) {
    final noteProvider = Provider.of<TreatmentProvider>(context, listen: false);
    noteProvider.fetchAllTreatments(10).then((_) {
      if (id != null) {
        final initialIndex = noteProvider.allTreatments.indexWhere(
              (place) => place.id == id,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TreatmentProvider>(builder: (context, treatProvider, child) {
      if (treatProvider.isLoading) {
        return Center(
          child: SpinKitHourGlass(
            color: Colors.green.shade700,
          ),
        );
      } else if (treatProvider.errorMessage != null) {
        return Center(
          child: Text(treatProvider.errorMessage!),
        );
      } else {
        return treatProvider.allTreatments.isEmpty
            ? Scaffold(
          body: BackGreoundImageContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TitleRow(textTitle: "    Treatments"),
                  Row(
                    children: [
                      SearchBarCustom(
                        controller: controller,
                        onTap: () {},
                        onPressedSearch: () {},
                        w: 555,
                        h: 50,
                        keyboardType: TextInputType.text,
                        hintText: "Search your treatment",
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    width: 600,
                    height: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/treatment.png"),
                        const Text(
                          "No treatments yet! don\'t worry add here !",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: CustomFloatingButton(
            onPressed: () async {
    
              await treatProvider.fetchAllTreatments(10);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddTreatment(
           
                  ),),);
            },
          ),
          bottomNavigationBar: DoctorNavBar(),
        )
            : AllTreatments(id: 9,);
      }
    });
  }
}

