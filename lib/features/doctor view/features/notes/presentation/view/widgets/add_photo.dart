import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImage extends StatelessWidget {
  final VoidCallback onPickImage;
  final String? imagePath;

  const AddImage({
    Key? key,
    required this.onPickImage,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color(0xff44885C),
      ),
      child: IconButton(
        onPressed: onPickImage,
        icon: Image.asset('assets/images/save note.png') ,// Changed to a more appropriate icon
      ),
    );
  }
}



