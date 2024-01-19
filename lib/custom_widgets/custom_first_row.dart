
import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';

class FirstCowStatusRow extends StatelessWidget  with MyConstants{
  FirstCowStatusRow({required this.imagePath,required this.cowID,required this.isNormal,super.key});

  String imagePath;
  String cowID;
  bool isNormal;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 150,
        width: 170,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 80,
          color: isNormal?Colors.green:Colors.red,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Cow ID"),
      ),
      titleTextStyle: TextStyle(fontSize: 33, color: titleColor),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          cowID,
        ),
      ),
      subtitleTextStyle: TextStyle(color: titleColor, fontSize: 27),
    );
  }
}
