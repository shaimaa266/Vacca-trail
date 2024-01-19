import 'package:app_vacca/cow_data/cow_normal.dart';
import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';

class CowFeatureRows extends StatefulWidget {
  CowFeatureRows({Key? key}) : super(key: key);

  @override
  State<CowFeatureRows> createState() => _CowFeatureRowsState();
}

class _CowFeatureRowsState extends State<CowFeatureRows> with MyConstants {
  int index = 0;


  List<String> imagesPaths = [

    "assets/images/cow eating.jfif",
    "assets/images/nav bar cow icon.png",
  ];

  List<String> cowIds = ["002","003"];

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CowNormal()));
        },
        child: Row(
          children: [
            Container(
              width: 140,
              height: 70,
              child: CircleAvatar(
                backgroundColor: containerColor,
               backgroundImage:  AssetImage(imagesPaths[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0,right: 16.0),
              child: Text(
                "Cow ID",
                style: TextStyle(
                    color: titleColor, fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33,right: 16),
              child: Text(
                cowIds[index],
                style: TextStyle(
                    color: titleColor, fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
