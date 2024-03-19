
import 'package:app_vacca/features/Ui/custom_widgets/constants_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOne extends StatelessWidget with MyConstants {
  PageOne({required this.imagePath,super.key});
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 600.w,
          height: 290.h,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(28),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 293.h,
            child: ListView(
            scrollDirection: Axis.vertical,
              children: [
                Text(
                  "Lorem ipsum dolor sit amet, vitae proin sagittis nisl. Quis enim lo Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui Lorem ipsum dolor sit amet, consectetur adipiscing Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.Lorem ipsum dolor sit amet, consectetur adipiscing AdipiscingLorem ipsum dolor sit amet, consectetur adipiscing Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.Lorem ipsum dolor sit amet, consectetur adipiscing Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.Lorem ipsum dolor sit amet, consectetur adipiscing Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam. vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.faucibus in ornare quam.",
                  style: TextStyle(fontSize: 33.sp, color: titleColor,fontWeight: FontWeight.w600),
                ),
              ],

            ),
          ),
        )
      ],
    );
  }
}