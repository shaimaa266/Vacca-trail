

import 'package:app_vacca/features/display%20view/cow_status/cow_status_rows.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/first_row_title.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CowStatus extends StatelessWidget with MyConstants {
  CowStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TitleRow(textTitle: "Cow Status"),
            SearchBarCustom(
              w:555,h:50, keyboardType: TextInputType.text,
              hintText: "Search...",
            ),
            SizedBox(
              height: 850.h,
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
      ),
      ),
      bottomNavigationBar:  const Mynavbar(),
    );
  }
}
