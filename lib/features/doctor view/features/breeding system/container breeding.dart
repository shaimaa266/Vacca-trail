

import 'package:app_vacca/features/doctor%20view/features/breeding%20system/view%20system/view_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreedingContainer extends StatelessWidget {
  BreedingContainer({super.key});
  List<String> images = [
    "assets/images/cow.jpg",
    "assets/images/cow breeding.png",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/cowww.jpg",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow.jpg",
    "assets/images/cow eating.png",
    "assets/images/cow.jpg",
    "assets/images/cow breeding.png",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/cowww.jpg",
    "assets/images/cow eating in place.jpg",
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < images.length; i++) {
      index++;
    }
    return SizedBox(
      height: 665.h,
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
            width: 265,
            height: 430,
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
                  style: TextStyle(fontSize: 24.sp, color: Colors.blueGrey,fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Lorem ipsum dolor sit amet,Lorem ipsum ,",
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
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff44885C)),
                    child: MaterialButton(
                      child: const Text(
                        "view more",
                        style:
                            TextStyle(color: Color(0xffEAEEEC), fontSize: 17,fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewBreedSystem(),),);
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
