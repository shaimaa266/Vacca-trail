import 'package:app_vacca/custom_widgets/constants_mixin.dart';

import 'package:flutter/material.dart';

class CowStatusRows extends StatelessWidget with MyConstants {
  bool cowRed;
  CowStatusRows({required this.cowRed, Key? key}) : super(key: key);

  static int _index = 0;
  static List<bool> cowStatusList = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    true
  ];
  _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          child: FractionallySizedBox(
            heightFactor: 0.4,
            child: Column(
              children: [
                Text(
                  "Cow ID: 003",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: titleColor),
                ),
                const Spacer(),
                Text(
                  " Cow is not normal?: $cowRed   ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: titleColor),
                ),
                const Spacer(),
                Text(
                  " Activity system : 02   ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: titleColor),
                ),
                 const Spacer(),
                Text(
                  "  Activity place : 01",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: titleColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    cowRed = cowStatusList[_index];

    _index = (_index + 1) % cowStatusList.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        InkWell(
          onTap: () {
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.blue,
              ),
              child: _showBottomSheet(context),
            );
          },
          child: ListTile(
            leading: Container(
              width: 90,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: containerColor, blurRadius: 6)],
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/images/normal cow.png",
                width: 80,
                height: 80,
                color: cowRed ? Colors.red : Colors.green,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Cow ID",
                style: TextStyle(color: titleColor, fontSize: 26),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "003",
                style: TextStyle(color: titleColor, fontSize: 22),
              ),
            ),
            trailing: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: cowRed ? Colors.red : baseColor,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}


