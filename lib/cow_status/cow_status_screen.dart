import 'package:app_vacca/custom_widgets/background_image_container.dart';
import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/cow_status/cow_status_rows.dart';
import 'package:app_vacca/custom_widgets/first_row_title.dart';
import 'package:app_vacca/custom_widgets/navigation_bar_custom.dart';
import 'package:app_vacca/custom_widgets/search_bar.dart';
import 'package:flutter/material.dart';

class CowStatus extends StatelessWidget with MyConstants {
  CowStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,

      body: BackGreoundImageContainer(
        child:SingleChildScrollView(
          child:Column(
            children: [
              TitleRow(textTitle: "Cow Status"),
              SearchBarCustom(keyboardType: TextInputType.text,hintText: "Search...",),
              Container(
                height: 560,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return CowStatusRows(
                      cowRed: true,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
