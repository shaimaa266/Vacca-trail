import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarCustom extends StatelessWidget with MyConstants {
  SearchBarCustom(
      {required this.keyboardType,
      required this.onPressedSearch,
      required this.onTap,
      required this.hintText,
      required this.w,
      required this.h,
      super.key,
      required this.controller});

  final TextInputType keyboardType;
  final String hintText;
  double h;
  double w;
  final TextEditingController controller;
  final Function() onTap;
  final Function() onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.grey[500]!, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 17,
                    spreadRadius: 6,
                    offset: const Offset(0, 0),
                  ),
                ]),
            height: h.h,
            width: w.w,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 3, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 8,
                    ),
                    child: SizedBox(
                      width: 350.w,
                      height: 55.h,
                      child: TextField(
                        maxLines: 6,
                        keyboardType: keyboardType,
                        controller: controller,
                        onTap: onTap,
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: hintTextColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 59.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: const Color(0xff44885C),
                    ),
                    child: IconButton(
                        onPressed: onPressedSearch,
                        icon: Image.asset(
                          "assets/images/search icon.png",
                          color: containerColor,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
