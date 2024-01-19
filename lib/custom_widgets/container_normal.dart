import 'package:flutter/material.dart';

class ContainerNormal extends StatelessWidget {
  ContainerNormal({required this.text,required this.isSelected, super.key});
  bool isSelected = true;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16, top: 16, bottom: 26),
      child: Container(
        width: 130,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              isSelected ?  null:Border.all(color: Colors.black54, width: 3) ,
          color: isSelected?Color(0xffb185C30):Colors.red,
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 26),)),
      ),
    );
  }
}
