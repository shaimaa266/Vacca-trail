import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';

import 'package:flutter/material.dart';

import '../shared/custom_floating_button.dart';
import '../shared/title.dart';
import 'activity sys container.dart';
import 'add.dart';

class ActivitySysDoctorPage extends StatelessWidget {
  ActivitySysDoctorPage({super.key});
  final dynamic route = AddActSystem();
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
                const MyTitle(text: "Activity System"),
                const SizedBox(
                  height: 15,
                ),
                SearchBarCustom(
                    w:555,h:50, keyboardType: TextInputType.text, hintText: "Search..."),
                ActivitySysContainer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
      floatingActionButton: CustomFloatingButton(
        route: route,
      ),
    );
  }
}
