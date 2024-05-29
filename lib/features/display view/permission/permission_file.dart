import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../doctor view/features/home/view/home page.dart';
import '../../doctor view/features/shared/doctor_nav_bar.dart';

class PermissionsDialog extends StatefulWidget {
  @override
  _PermissionsDialogState createState() => _PermissionsDialogState();
}

class _PermissionsDialogState extends State<PermissionsDialog> {
  bool isDoctor = false;

  void _showFirstDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomIcon(icon: Icons.notifications_active_sharp),
          content: CustomText(text: "Allow Vacca to send you notifications ?"),
          actions: [
            ElevatedButton(
              onPressed: () async {
                PermissionStatus cameraStatus =
                    await Permission.camera.request();
                if (cameraStatus == PermissionStatus.denied) {
                  const ScaffoldMessenger(
                    child: SnackBar(
                      content: Text("This permission is recommended"),
                    ),
                  );
                }
                if (cameraStatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings();
                }

                Navigator.pop(context);
                _showSecondDialog();
              },
              child: CustomText(text: "Deny"),
            ),
            ElevatedButton(
              onPressed: () async {
                PermissionStatus cameraStatus =
                    await Permission.camera.request();
                if (cameraStatus == PermissionStatus.granted) {
                  Navigator.pop(context);
                  _showSecondDialog();
                }
              },
              child: CustomText(text: "Allow"),
            ),
          ],
        );
      },
    );
  }

  void _showSecondDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: CustomIcon(icon: Icons.camera_alt),
            content: CustomText(text: "Allow Vacca to access your camera ? "),
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
                  child: CustomText(text: "Deny")),
              ElevatedButton(
                  onPressed: () async {
                    PermissionStatus fileStatus =
                        await Permission.manageExternalStorage.request();
                    if (fileStatus == PermissionStatus.granted) {}
                    Navigator.of(context).pop();
                    _showThirdDialog();
                  },
                  child: CustomText(text: "Allow"))
            ],
          );
        });
  }

  _showThirdDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomIcon(icon: Icons.location_on),
          content: CustomText(text: "Allow Vacca to view your location?"),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus locationStatus =
                      await Permission.location.request();
                  if (locationStatus == PermissionStatus.denied) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("This permission is recommended"),
                      ),
                    );
                  }
                  if (locationStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }
                  isDoctor
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()))
                      : Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Home()));
                },
                child: CustomText(text: "Deny")),
            ElevatedButton(
                onPressed: () async {
                  PermissionStatus locationStatus =
                      await Permission.location.request();
                  if (locationStatus == PermissionStatus.granted) {
                    setState(() {});
                  }
                  isDoctor
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()))
                      : Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Home()));
                },
                child: CustomText(text: "Allow")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _showFirstDialog();
              },
              child: const Text('Login'),
            ),
            Expanded(
              child: Container(
                child: isDoctor ? DoctorNavBar() : const Mynavbar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomIcon({required IconData icon}) {
  return Icon(
    icon,
    size: 40.sp,
  );
}

Widget CustomText({required String text}) {
  return Text(
    text,
    style: TextStyle(color: Color(0xff263238), fontSize: 25.sp),
  );
}
