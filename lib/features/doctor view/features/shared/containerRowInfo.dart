import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text font body.dart';

class containerRowInfo extends StatelessWidget {
  const containerRowInfo({super.key, required this.cText, required this.dataText});
 final String cText;
final  String dataText;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xff89A492),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TextFont(height: 30, text: cText, isDark: true),
            const SizedBox(width: 10),
            TextFont(height: 30, text: dataText, isDark: true),
            Image.asset("assets/images/image .png"),
          ],
        ),
      ),
    );
  }
}
