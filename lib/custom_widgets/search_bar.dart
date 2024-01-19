import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget with MyConstants {
  SearchBarCustom(
      {required this.keyboardType, required this.hintText, super.key});

  TextInputType keyboardType;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: hintTextColor, width: .5),
                boxShadow: [BoxShadow(color: containerColor, blurRadius: 3)]),
            height: 45,
            width: 330,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 3, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Container(
                      width: 220,
                      height: 44,
                      child: TextField(
                        keyboardType: keyboardType,
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: hintTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      width: 35,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: containerBorderColor),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/search icon.png",
                            width: 100,
                            height: 70,
                            color: containerColor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/sort icon.png",
                width: 90,
                height: 80,
                color: Colors.black87,
              ))
        ],
      ),
    );
  }
}
