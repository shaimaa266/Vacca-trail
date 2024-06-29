import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20system/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/first_row_title.dart';
import '../../../../core/widgets/text font body.dart';
import '../../../display view/activity_system/data/models/activity_system_model.dart';
import '../../../display view/activity_system/presentation/control/activity_system_provider.dart';
import '../shared/button_customized.dart';

class ViewActSystem extends StatelessWidget  with MyConstants{
  final ActivitySystemModel activitySystemModel;
 ViewActSystem({super.key, required this.activitySystemModel});

  @override
  Widget build(BuildContext context) {
    final actSystem =
    Provider.of<ActivitySystemsProvider>(context, listen: false);

    return Scaffold(
      body: BackGreoundImageContainer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 43,
            bottom: 8,
          ),
          child: FutureBuilder(
              future: actSystem.fetchAllActivitySystems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitHourGlass(
                      color: Colors.green.shade700,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Consumer<ActivitySystemsProvider>(
                      builder: (context, noteProvider, child) {
                        if (noteProvider.errorMessage != null) {
                          return Center(
                            child: Text(noteProvider.errorMessage!),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TitleRow(textTitle: " view a system  "),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: 600.w,
                                  height: 190.h,
                                  decoration: BoxDecoration(
                                    color: containerColor,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(28),
                                    child: Image.asset(
                                   actSystem.images[actSystem.currentPage] ,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const TextFont(
                                            text: "Name : ",
                                            height: 40,
                                            isDark: false,
                                          ),
                                          TextFont(
                                            text: activitySystemModel.name,
                                            height: 40,
                                            isDark: true,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20,),
                                      const TextFont(
                                        text: "Cause of Creation:",
                                        height: 30,
                                        isDark: false,
                                      ),
                                      Text(
                                        activitySystemModel.cause_of_creation,
                                        style: TextStyle(
                                          fontSize: 33.sp,
                                          fontFamily: 'Urbanist',
                                          color: const Color(0xff263238),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const TextFont(
                                        text: "System activities:",
                                        height: 30,
                                        isDark: false,
                                      ),
                                      Text(
                                        activitySystemModel.activities!,
                                        style: TextStyle(
                                          fontSize: 33.sp,
                                          fontFamily: 'Urbanist',
                                          color: const Color(0xff263238),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const TextFont(
                                        text: "System Goal:",
                                        height: 30,
                                        isDark: false,
                                      ),
                                      Text(
                                        activitySystemModel.goal,
                                        style: TextStyle(
                                          fontSize: 33.sp,
                                          fontFamily: 'Urbanist',
                                          color: const Color(0xff263238),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 30,),
                                      const TextFont(
                                        text: "Description:",
                                        height: 30,
                                        isDark: false,
                                      ),
                                      Text(
                                        activitySystemModel.description,
                                        style: TextStyle(
                                          fontSize: 33.sp,
                                          fontFamily: 'Urbanist',
                                          color: const Color(0xff263238),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      const TextFont(
                                        text: "sleep time :",
                                        height: 30,
                                        isDark: false,
                                      ),
                                      Text(
                                        activitySystemModel.sleepTime,
                                        style: TextStyle(
                                          fontSize: 33.sp,
                                          fontFamily: 'Urbanist',
                                          color: const Color(0xff263238),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      const TextFont(
                                        text: "wakeup  time :",
                                        height: 30,
                                        isDark: false,
                                      ),
                                      Text(
                                        activitySystemModel.wakeUpTime,
                                        style: TextStyle(
                                          fontSize: 33.sp,
                                          fontFamily: 'Urbanist',
                                          color: const Color(0xff263238),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          if (activitySystemModel.cows!.isNotEmpty)
                                            DropdownButton<String>(
                                              focusColor: Colors.grey[300],
                                              items: activitySystemModel.cows!.map((cow) {
                                                return DropdownMenuItem<String>(
                                                  value: cow.cowId.toString(),
                                                  child: Center(
                                                      child: Row(
                                                        children: [
                                                          Text("Cow ID: ${cow.cowId}"),
                                                          const SizedBox(
                                                            width: 35,
                                                          ),
                                                          CircleAvatar(
                                                            radius: 3,
                                                            backgroundColor: cow.cow_status == 0
                                                                ? baseColor
                                                                : Colors.red,
                                                          )
                                                        ],
                                                      )),
                                                );
                                              }).toList(),
                                              onChanged: (val) {},
                                              hint: TextFont(
                                                text:
                                                "Applied on : ${activitySystemModel.cows!.length} cows        ",
                                                height: 30,
                                                isDark: true,
                                              ),
                                            )
                                          else
                                            const TextFont(
                                              text: "No cows in this place.",
                                              height: 40,
                                              isDark: true,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                AddButton(
                                  onPressed: () async {
                                   
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditActSystem(activitySystemModel: activitySystemModel),
                                      ),
                                    );
                                  },
                                  text: "edit system",
                                ),
                              ],
                            ),
                          );
                        }
                      });
                }
              }),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
