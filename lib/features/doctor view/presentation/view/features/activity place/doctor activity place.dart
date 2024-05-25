import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/activity%20place/activityPlace%20container.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/title.dart';
import 'package:flutter/material.dart';

class ActivityPlaceDoctorPage extends StatelessWidget {
  const ActivityPlaceDoctorPage({super.key});

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
                const MyTitle(text: "Activity Place"),
                const SizedBox(
                  height: 15,
                ),
                SearchBarCustom(
                    w:555,h:50, keyboardType: TextInputType.text, hintText: "Search..."),
                ActivityPlaceContainer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
