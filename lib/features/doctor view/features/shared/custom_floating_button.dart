import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key, this.route});
  final dynamic route;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(
        side: BorderSide(
          width: 2,
          color: Color(0xff44885C),
          style: BorderStyle.solid,
        ),
      ),
      backgroundColor: const Color(0xff44885C),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
