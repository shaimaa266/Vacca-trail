import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'cow_feature_rows.dart';

class CowFeature extends StatefulWidget {
  CowFeature({Key? key}) : super(key: key);

  @override
  State<CowFeature> createState() => _CowFeatureState();
}

class _CowFeatureState extends State<CowFeature> with MyConstants {

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cowProvider =
      Provider.of<CowProvider>(context, listen: false);
      await cowProvider.fetchAllCows();
    });
  }
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
                    SizedBox(
                      width: 140.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Cows",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 43.sp,
                            color: titleColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: SizedBox(
                        width: 70.w,
                        height: 40.h,
                        child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/sort icon.png",
                              color: Colors.black87,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Consumer<CowProvider>(
                builder: (context, cowProvider, child) => SizedBox(
                  height: 1210.w,
                  child: ListView.builder(
                    itemCount: cowProvider.cows.length,
                    itemBuilder: (BuildContext context, index) {
                      if (cowProvider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (cowProvider.errorMessage != null) {
                        return Center(child: Text(cowProvider.errorMessage!));
                      } else {
                        final cows = cowProvider.cows[index];

                        return SizedBox(
                            height: 140.h,
                            child: CowFeatureRows(cowId: cows.cowId));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}