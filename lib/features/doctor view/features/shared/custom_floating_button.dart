import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
 CustomFloatingButton({super.key, required this.onPressed});

  Function()onPressed;
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
      onPressed: onPressed,

      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
