


import 'package:app_vacca/features/display%20view/home/home_screen.dart';
import 'package:app_vacca/features/display%20view/permission/permission_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 50, end: 840).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward().then((_) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PermissionsDialog()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body:Image.asset('assets/images/splash.png',fit: BoxFit.fill,),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
