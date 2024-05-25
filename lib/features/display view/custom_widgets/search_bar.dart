

import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/doctor%20view/presentation/manage/state%20managment/providerHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchBarCustom extends StatelessWidget with MyConstants {
   SearchBarCustom(
      {required this.keyboardType, required this.hintText, required this.w,required this.h,super.key});

   final TextInputType keyboardType;
   final String hintText;
double h;
double w;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHelper>(
      builder: (context, providerHelper, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: Colors.grey[500]!, width: .75),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 17,
                      spreadRadius: 6,
                      offset: const Offset(0, 0),
                    ),
                  ]),
              height:h.h,
              width: w.w,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 6, bottom: 6, left: 3, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,right: 8,
                      ),
                      child: SizedBox(
                        width: 220.w,
                        height: 44.h,
                        child: TextField(
                          maxLines:4,
                          keyboardType: keyboardType,
                          controller: providerHelper.searchController,
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
                        color:  const Color(0xff44885C),
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
          ),

        ],
      ),
    );
  }
}
