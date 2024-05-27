import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/first_row_title.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'cow_status_rows.dart';

class CowStatus extends StatefulWidget {
  CowStatus({Key? key}) : super(key: key);

  @override
  State<CowStatus> createState() => _CowStatusState();
}

class _CowStatusState extends State<CowStatus> with MyConstants {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final cowProvider = Provider.of<CowProvider>(context, listen: false);
        await cowProvider.fetchAllCows();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Consumer<CowProvider>(
            builder: (context, cowProvider, child) {
              if (cowProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (cowProvider.errorMessage != null) {
                return Center(
                  child: Text(cowProvider.errorMessage!),
                );
              } else {
                return Column(
                  children: [
                    TitleRow(textTitle: "Cow Status"),
                    SearchBarCustom(
                      w: 555,
                      h: 50,
                      keyboardType: TextInputType.text,
                      hintText: "Search...",
                    ),
                    SizedBox(
                      height: 850.h,
                      child: ListView.builder(
                          itemCount: cowProvider.cows.length,
                          itemBuilder: (BuildContext context, index) {
                            final cow = cowProvider.cows[index];
                            return CowStatusRows(
                              cow: cow,
                            );
                          }),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
