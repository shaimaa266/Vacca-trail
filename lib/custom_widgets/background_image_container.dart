import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';

class BackGreoundImageContainer extends StatelessWidget with MyConstants {
 BackGreoundImageContainer({required this.child,key});
Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(image:DecorationImage(
        image:AssetImage(backgroundImage),
        fit: BoxFit.cover,
      ) ),
      child: child,
    );
  }
}
