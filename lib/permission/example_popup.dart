/*import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MyConstants {
  bool _loggedIn = false;
  bool _dialogShown = false;
  @override
  void initState() {
    _checkFirstLogin();
    super.initState();
  }

  _checkFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool dialogShown = prefs.getBool('dialogShown') ?? false;

    if (!_dialogShown) {
      _showFirstDialog();
      prefs.setBool('dialogShown', true);
    } else {
      setState(() {
        _dialogShown = true;
      });
    }
  }

//notifications dialog..
  void _showFirstDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.notifications_rounded),
          content: const Text('Allow Vacca to send notifications ?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                PermissionStatus notifyStatus =
                    await Permission.notification.request();
                if (notifyStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("This permission is recommended"),
                    ),
                  );
                }
                if (notifyStatus == PermissionStatus.permanentlyDenied) {
                  openAppSettings();
                }

                Navigator.pop(context);
                _showSecondDialog();
              },
              child: CustomText(text: "deny"),
            ),
            ElevatedButton(
              onPressed: () async {
                PermissionStatus notifyStatus =
                    await Permission.notification.request();
                if (notifyStatus == PermissionStatus.granted) {
                  Navigator.pop(context);
                  _showSecondDialog();
                }
              },
              child: CustomText(text: "allow"),
            ),
          ],
        );
      },
    );
  }

//camera dialog..
  void _showSecondDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(Icons.camera_alt),
            content: const Text("allow Vacca to access  your camera? "),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  PermissionStatus cameraStatus =
                      await Permission.camera.request();
                  if (cameraStatus == PermissionStatus.denied) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("This permission is recommended"),
                      ),
                    );
                  }
                  if (cameraStatus == PermissionStatus.permanentlyDenied) {
                    openAppSettings();
                  }

                  Navigator.pop(context);
                  _showThirdDialog();
                },
                child: CustomText(text: "deny"),
              ),
              ElevatedButton(
                onPressed: () async {
                  PermissionStatus cameraStatus =
                      await Permission.manageExternalStorage.request();
                  if (cameraStatus == PermissionStatus.granted) {}
                  Navigator.of(context).pop();
                  _showThirdDialog();
                },
                child: CustomText(text: "allow"),
              ),
            ],
          );
        });
  }

//location dialog..
  _showThirdDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.location_on),
          content: Text("allow vacca to view your location?"),
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
                Navigator.of(context).pop();
              },
              child: CustomText(text: "deny"),
            ),
            ElevatedButton(
              onPressed: () async {
                PermissionStatus locationStatus =
                    await Permission.location.request();
                if (locationStatus == PermissionStatus.granted) {
                  setState(() {
                    _loggedIn = true;
                  });
                }
                Navigator.pop(context);
              },
              child: CustomText(text: "allow"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_loggedIn)
              ElevatedButton(
                onPressed: () {
                  _showFirstDialog();
                },
                child: const Text('Login'),
              ),
            if (_loggedIn) const Text('Successfully logged in!'),
          ],
        ),
      ),
    );
  }
}

Widget CustomText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 17,
    ),
  );
}

// for files storing
// need >>  import 'package:path_provider/path_provider.dart'; + permission handler package.
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
