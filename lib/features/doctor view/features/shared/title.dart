import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(
          width: 60,
        ),
         Text(
          text,
          style: const  TextStyle(
            color: Color(0xff263238),
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
