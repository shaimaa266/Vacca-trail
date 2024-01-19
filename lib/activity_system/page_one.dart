import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/cupertino.dart';

class PageOne extends StatelessWidget with MyConstants {
  PageOne({required this.imagePath,super.key});
String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          height: 250,
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
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.",
            style: TextStyle(fontSize: 26, color: titleColor),
          ),
        )
      ],
    );
  }
}
