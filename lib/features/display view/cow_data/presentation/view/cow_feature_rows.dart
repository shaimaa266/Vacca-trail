

import 'package:app_vacca/features/display%20view/cow_data/cow_normal.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/doctor%20view/presentation/manage/state%20managment/providerHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CowFeatureRows extends StatefulWidget {
  CowFeatureRows({Key? key}) : super(key: key);

  @override
  State<CowFeatureRows> createState() => _CowFeatureRowsState();
}

class _CowFeatureRowsState extends State<CowFeatureRows> with MyConstants {
  List<String> imagesPaths = [
    "assets/images/cow eating in place.jpg",
    "assets/images/cow eating.png",
  ];

  List<String> cowIds = ["002", "003"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<ProviderHelper>(
        builder: (context, providerHelper, child) => InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CowNormal()));
          },
          child: Row(
            children: [
              SizedBox(
                width: 200.w,
                height: 100.h,
                child: CircleAvatar(
                  backgroundColor: containerColor,
                  backgroundImage:
                      AssetImage(imagesPaths[providerHelper.index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 16.0),
                child: Text(
                  "Cow ID",
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 16),
                child: Text(
                  cowIds[providerHelper.index],
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
