import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget with MyConstants {
  TitleRow({required this.textTitle, super.key});
  String textTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 33,bottom: 16,left: 8,right: 8),
      child: Container(
        height: 70,
        child: Row(

          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,size: 30,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                textTitle,
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.w400, color: titleColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
