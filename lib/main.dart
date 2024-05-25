import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:app_vacca/features/display%20view/activity_places/data/repos/activity_place_repo.dart';
import 'package:app_vacca/features/display%20view/activity_places/presentation/control/activity_place_provider.dart';
import 'package:app_vacca/features/display%20view/activity_system/data/repo/activity_system_repo.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:app_vacca/features/display%20view/breeding_system/data/repos/breedingRepo.dart';
import 'package:app_vacca/features/display%20view/breeding_system/presentation/manage/breeding_provider.dart';
import 'package:app_vacca/features/display%20view/permission/permission_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'features/doctor view/presentation/manage/state managment/providerHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final dio = Dio();

  BreedingRepo breedingRepo = BreedingRepo(
    ApiService(
        baseUrl: 'https://7326-156-197-197-176.ngrok-free.app/api',
        dio: Dio(),
        token: "4|lKpe9uxto1VyXkKs5SMJAo0Cyh7UaSwYaNk02rEbdbc54d23"),
  );
  ActivitySystemsRepo activitySystemsRepo = ActivitySystemsRepo(
    ApiService(
        dio: Dio(),
        token: "4|lKpe9uxto1VyXkKs5SMJAo0Cyh7UaSwYaNk02rEbdbc54d23",
        baseUrl: "https://7326-156-197-197-176.ngrok-free.app/api"),
  );
  ActivityPlaceRepo activityPlaceRepo = ActivityPlaceRepo(
    ApiService(
        baseUrl: 'https://7326-156-197-197-176.ngrok-free.app/api',
        dio: Dio(),
        token: "4|lKpe9uxto1VyXkKs5SMJAo0Cyh7UaSwYaNk02rEbdbc54d23"),
  );
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
                create: (_) => ActivitySystemsProvider(activitySystemsRepo)),
            ChangeNotifierProvider(
                create: (_) => ActivityPlacesProvider(activityPlaceRepo)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: PermissionsDialog(),
    );
  }
}
