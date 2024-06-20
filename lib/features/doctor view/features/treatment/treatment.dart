import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/first_row_title.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/custom_floating_button.dart';
import '../shared/doctor_nav_bar.dart';
import 'add treatment.dart';
import 'all treatment.dart';

class EmptyTreatment extends StatelessWidget {
  EmptyTreatment({super.key});
  bool isEmpty = false;
  final TextEditingController controller=TextEditingController();
  final dynamic route = AddTreatment();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleRow(textTitle: "   Treatment"),
              SearchBarCustom(
                controller: controller,
                onTap: (){},
                onPressedSearch: (){},
                w: 635,
                h: 50,
                keyboardType: TextInputType.text,
                hintText: "Search ",
              ),
              SizedBox(
                width: 600,
                height: 700,
                child: isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80.h,
                          ),
                          Image.asset("assets/images/treatment.png"),
                          Text(
                            "No treatments yet! don\'t worry add here !",
                            style: TextStyle(
                                fontSize: 28.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : AllTreatments(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        route: route,
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
