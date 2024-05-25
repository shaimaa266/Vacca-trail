

import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/breeding%20system/container%20breeding.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/breeding%20system/create%20system/add%20system.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/custom_floating_button.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/title.dart';
import 'package:flutter/material.dart';

class BreedingDoctorPage extends StatelessWidget {
  BreedingDoctorPage({super.key});
final dynamic route=AddBreedSystem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 36.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyTitle(text: "Breeding System"),
                const SizedBox(
                  height: 15,
                ),
                SearchBarCustom(
                    w:555,h:50,keyboardType: TextInputType.text, hintText: "Search..."),
                BreedingContainer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
      floatingActionButton:CustomFloatingButton(route: route,)
    );
  }
}
