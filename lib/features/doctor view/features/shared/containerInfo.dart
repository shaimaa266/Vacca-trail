import 'package:flutter/material.dart';

import '../../../../core/widgets/text font body.dart';

class containerInfo extends StatelessWidget {
  const containerInfo({super.key, required this.cText, required this.dataText, required this.h});
  final  String cText;final  String dataText; final double h;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xff89A492),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFont(height: 30, text: cText, isDark: true),
            TextFont(height: h, text: dataText, isDark: true),
          ],
        ),
      ),
    );
  }
}
