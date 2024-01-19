import 'package:app_vacca/cow_data/cow_feature_rows.dart';
import 'package:app_vacca/custom_widgets/background_image_container.dart';
import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/custom_widgets/navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class CowFeature extends StatefulWidget {
  CowFeature({Key? key}) : super(key: key);

  @override
  State<CowFeature> createState() => _CowFeatureState();
}

class _CowFeatureState extends State<CowFeature> with MyConstants {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(

                  children: [
                    SizedBox(width: 140,),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Cows",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 27,
                            color: titleColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: SizedBox(
                        width: 70,
                        height: 40,
                        child: InkWell(onTap: (){},child: Image.asset("assets/images/sort icon.png",color: Colors.black87,)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 626,
                child: ListView.builder(
                    itemCount: 18,
                    itemBuilder: (BuildContext context, index) {
                      return Container(height:140,child: CowFeatureRows());
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
