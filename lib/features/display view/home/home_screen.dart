import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/home/container_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget with MyConstants {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BackGreoundImageContainer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                child: Center(
                    child: Text(
                  "Home",
                  style: TextStyle(
                      color: titleColor,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w900,
                      fontSize: 60.sp),
                )),
              ),
              SizedBox(height: 630.h, child: FeatureContainer()),
            ],
          ),
        ),
        bottomNavigationBar: const Mynavbar());
  }
}

/*
 for files storing
 need >>  import 'package:path_provider/path_provider.dart'; + permission handler package.
AlertDialog(
            title: Icon(Icons.file_open_sharp),
            content: Text("allow vacca to access  your files? "),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    PermissionStatus fileStatus =
                    await Permission.manageExternalStorage.request();
                    if (fileStatus == PermissionStatus.denied) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("This permission is recommended"),
                        ),
                      );
                    }
                    if (fileStatus == PermissionStatus.permanentlyDenied) {
                      openAppSettings();
                    }

                    Navigator.pop(context);
                    _showThirdDialog();
                  },
                  child: Text('deny')),
              ElevatedButton(
                  onPressed: () async {
                    PermissionStatus fileStatus =
                    await Permission.manageExternalStorage.request();
                    if (fileStatus == PermissionStatus.granted) {
                      _accessFiles();
                    }
                    Navigator.of(context).pop();
                    _showThirdDialog();
                  },
                  child: Text("allow"))
            ],
          ),

           void _accessFiles() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    //String appDocPath = appDocDir.path;

    List<FileSystemEntity> fileList = appDocDir.listSync();

    fileList.forEach((file) {
      print(file.path);
    });
  }

          */
