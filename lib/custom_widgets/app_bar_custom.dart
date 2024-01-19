import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget with MyConstants implements PreferredSize {
  AppBarCustom({required this.titleText,super.key});
String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff263238),
            size: 35,
          )),
      leadingWidth: 5.0,
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(titleText),
      titleTextStyle: TextStyle(
          color: titleColor, fontSize: 33, fontWeight: FontWeight.w400),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
