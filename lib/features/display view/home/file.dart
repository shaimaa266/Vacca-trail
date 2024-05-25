

import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:flutter/material.dart';

class File extends StatelessWidget {
  File({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(child:  Text("setting "),),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
