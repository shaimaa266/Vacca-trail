import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:app_vacca/features/display%20view/activity_places/data/repos/activity_place_repo.dart';
import 'package:app_vacca/features/display%20view/activity_places/presentation/control/activity_place_provider.dart';
import 'package:app_vacca/features/display%20view/activity_system/data/repo/activity_system_repo.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:app_vacca/features/display%20view/breeding_system/data/repos/breedingRepo.dart';
import 'package:app_vacca/features/display%20view/breeding_system/presentation/manage/breeding_provider.dart';
import 'package:app_vacca/features/display%20view/cow_data/data/repo/cow_repo.dart';
import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/permission/permission_file.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/data/repo/note_repo.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/doctor_nav_bar.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/data/repo/treatment_repo.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/control/treatment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'features/doctor view/data/manage/state managment/providerHelper.dart';
import 'features/doctor view/features/notes/presentation/manage/notes_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final dio = Dio();

// shaza's token=3|MbCbORYgrxBkLrgeMG7KebpPftLEagyuGLnAXDjK140a448b;
  //hala's token=2|uOm8bShoz0L3Qdw8xDFQO4pdvtErFTGKJx7QgEjRd065c239;
  BreedingRepo breedingRepo = BreedingRepo(
    ApiService(
        baseUrl: 'https://5556-45-243-154-131.ngrok-free.app/api',
        dio: Dio(),
        token: "4|ZjRTddpB2HCdNLKkoxPxmuY9Jhv4NtTvBPZqK2uMc98d73ff"),
  );
  ActivitySystemsRepo activitySystemsRepo = ActivitySystemsRepo(
    ApiService(
        dio: Dio(),
        token: "4|ZjRTddpB2HCdNLKkoxPxmuY9Jhv4NtTvBPZqK2uMc98d73ff",
        baseUrl: "https://5556-45-243-154-131.ngrok-free.app/api"),
  );
  ActivityPlaceRepo activityPlaceRepo = ActivityPlaceRepo(
    ApiService(
        baseUrl: 'https://5556-45-243-154-131.ngrok-free.app/api',
        dio: Dio(),
        token: "4|ZjRTddpB2HCdNLKkoxPxmuY9Jhv4NtTvBPZqK2uMc98d73ff"),
  );
  CowRepo cowRepo = CowRepo(ApiService(
      token: '4|ZjRTddpB2HCdNLKkoxPxmuY9Jhv4NtTvBPZqK2uMc98d73ff',
      dio: Dio(),
      baseUrl: 'https://5556-45-243-154-131.ngrok-free.app/api'));
  NoteRepo noteRepo = NoteRepo(ApiService(
      token: '4|ZjRTddpB2HCdNLKkoxPxmuY9Jhv4NtTvBPZqK2uMc98d73ff',
      baseUrl: 'https://5556-45-243-154-131.ngrok-free.app/api',
      dio: Dio()));
  @override
  Widget build(BuildContext context) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    return ScreenUtilInit(
      designSize: const Size(700, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ProviderHelper(),
            ),
            ChangeNotifierProvider(
              create: (_) => BreedingProvider(breedingRepo),
            ),
            ChangeNotifierProvider(
              create: (_) => ActivitySystemsProvider(activitySystemsRepo),
            ),
            ChangeNotifierProvider(
              create: (_) => ActivityPlaceProvider(activityPlaceRepo),
            ),
            ChangeNotifierProvider(
              create: (_) => CowProvider(cowRepo),
            ),
            ChangeNotifierProvider(
              create: (context) => NotesProvider(noteRepo),
            ),
            ChangeNotifierProvider(
              create: (_) => TreatmentProvider(
                TreatmentRepo(
                  ApiService(
                      token:
                          '4|ZjRTddpB2HCdNLKkoxPxmuY9Jhv4NtTvBPZqK2uMc98d73ff',
                      dio: Dio(),
                      baseUrl:
                          'https://5556-45-243-154-131.ngrok-free.app/api'),
                ),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: DoctorNavBar(),
    );
  }
}
