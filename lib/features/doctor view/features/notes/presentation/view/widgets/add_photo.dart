

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

  File? _image;


  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 80.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color:  const Color(0xff44885C),
      ),
      child: IconButton(
        onPressed: () {
          _openImagePicker;


        },
        icon: Image.asset("assets/images/save note.png",),
      ),
    );
  }
}
