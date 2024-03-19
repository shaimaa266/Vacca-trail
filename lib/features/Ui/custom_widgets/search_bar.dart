import 'package:app_vacca/features/Ui/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/providerHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchBarCustom extends StatelessWidget with MyConstants {
  SearchBarCustom(
      {required this.keyboardType, required this.hintText, super.key});

  TextInputType keyboardType;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Consumer<ProviderHelper>(
        builder: (context, providerHelper, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: Colors.grey, width: .9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.10),
                      blurRadius: 8,
                      spreadRadius: 6,
                      offset: const Offset(0, 0),
                    ),
                  ]),
              height: 50.h,
              width: 566.w,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 6, bottom: 6, left: 3, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: SizedBox(
                        width: 220.w,
                        height: 44.h,
                        child: TextField(
                          keyboardType: keyboardType,
                          controller: providerHelper.searchController,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                              color: hintTextColor,
                              fontSize: 33.sp,
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
                        color: Color(0xff44885C),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/search icon.png",
                            color: containerColor,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/sort icon.png",
                  width: 90.w,
                  height: 80.h,
                  color: Colors.black87,
                ))
          ],
        ),
      ),
    );
  }
}
