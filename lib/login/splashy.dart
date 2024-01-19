import 'package:app_vacca/home/home_screen.dart';

import 'package:flutter/material.dart';

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
      // Navigate to the permission screen after the animation completes
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MYhOME()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              width: _animation.value,
              height: _animation.value,
              color: Colors.green,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 150,
            left: MediaQuery.of(context).size.width / 2 - 125,
            child: Image.asset(
              "assets/images/logo.png",
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 + 100,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: const Text(
              "Vacca",
              style: TextStyle(fontSize: 44, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
