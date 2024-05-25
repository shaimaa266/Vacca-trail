


import 'package:app_vacca/features/display%20view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MySplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isAnimated = false;
  late Animation<double> _containerAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 50, end: 840).animate(_controller)
      ..addListener(() {
        setState(() {
          isAnimated = true;
        });
      });

    _containerAnimation =
        Tween<double>(begin: 170, end: 1000).animate(_controller);

    _controller.forward().then((_) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isAnimated = false; // Change image size after 3 seconds
        });
      });

      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: _containerAnimation.value,
                  height: _containerAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: isAnimated ? 150.w : 600.w,
                height: isAnimated ? 150.h : 600.h,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 + 100,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child:  Text(
                "Vacca",
                style: TextStyle(fontSize: 44.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
