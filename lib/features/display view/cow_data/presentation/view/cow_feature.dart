


import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cow_feature_rows.dart';

class CowFeature extends StatelessWidget with MyConstants {
  CowFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 140.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Cows",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 43.sp,
                            color: titleColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: SizedBox(
                        width: 70.w,
                        height: 40.h,
                        child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/sort icon.png",
                              color: Colors.black87,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1100.w,
                child: ListView.builder(
                    itemCount: 18,
                    itemBuilder: (BuildContext context, index) {
                      return SizedBox(height: 140.h, child: CowFeatureRows());
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const  Mynavbar(),
    );
  }
}
