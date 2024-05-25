

import 'package:app_vacca/features/doctor%20view/presentation/view/features/activity%20place/view%20place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityPlaceContainer extends StatelessWidget {
  ActivityPlaceContainer({super.key});
  List<String> images = [

    "assets/images/cow breeding.png",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow eating.png",
    "assets/images/cow.jpg",
    "assets/images/cow breeding.png",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/cow eating in place.jpg",
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < images.length; i++) {
      index++;
    }
    return SizedBox(
      height: 645.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 290,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(bottom: 9, left: 12, right: 12),
          child: Container(
            width: 250,
            height: 370,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 4, left: 6, right: 6),
                  child: SizedBox(
                    width: 265.w,
                    height: 110.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Breeding Name",
                  style: TextStyle(fontSize: 22.sp, color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consecrate disciplining Ad consecrate disciplining Ad",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 6,
                ),
                Center(
                  child: Container(
                    width: 245.w,
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff44885C)),
                    child: MaterialButton(
                      child: const Text(
                        "view more",
                        style:
                        TextStyle(color: Color(0xffEAEEEC), fontSize: 13),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewPlace()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}