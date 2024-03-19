import 'package:app_vacca/features/Ui/permission/permission_file.dart';
import 'package:app_vacca/features/providerHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(700, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (_) => ProviderHelper(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child),
        );
      },
      child: LoginPage(),
    );
  }
}
