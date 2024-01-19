import 'package:app_vacca/custom_widgets/background_image_container.dart';
import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/custom_widgets/navigation_bar_custom.dart';
import 'package:app_vacca/home/container_features.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MYhOME extends StatefulWidget {
  @override
  State<MYhOME> createState() => _MYhOMEState();
}

class _MYhOMEState extends State<MYhOME> with MyConstants {
  bool _loggedIn = false;
  bool _dialogShown = false;
  @override
  void initState() {
    _checkFirstLogin();
    super.initState();
  }

  Widget customText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 17,
      ),
    );
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

  Widget denyButton({required String text}) {
    return ElevatedButton(
      onPressed: () async {
        if (text == PermissionStatus.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("This permission is recommended"),
            ),
          );
        }
        if (text == PermissionStatus.permanentlyDenied) {
          openAppSettings();
        }

        Navigator.pop(context);
        _showThirdDialog();
      },
      child: customText(text: "deny"),
    );
  }

//notifications dialog..
  void _showFirstDialog() async {
    PermissionStatus notifyStatus = await Permission.notification.request();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.notifications_rounded),
          content: const Text('Allow Vacca to send notifications ?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
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
                _showThirdDialog();
              },
              child: customText(text: "deny"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (notifyStatus == PermissionStatus.granted) {
                  Navigator.pop(context);
                  _showSecondDialog();
                }
              },
              child: customText(text: "allow"),
            )
          ],
        );
      },
    );
  }

//camera dialog..
  void _showSecondDialog() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(Icons.camera_alt),
            content: const Text("allow Vacca to access  your camera? "),
            actions: [
              ElevatedButton(
                onPressed: () async {
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
                child: customText(text: "deny"),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (cameraStatus == PermissionStatus.granted) {
                    Navigator.pop(context);
                    _showSecondDialog();
                  }
                },
                child: customText(text: "allow"),
              )
            ],
          );
        });
  }

//location dialog..
  _showThirdDialog() async {
    PermissionStatus locationStatus = await Permission.location.request();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.location_on),
          content: const Text("allow vacca to view your location?"),
          actions: [
            ElevatedButton(
              onPressed: () async {
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

                Navigator.pop(context);
                _showThirdDialog();
              },
              child: customText(text: "deny"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (locationStatus == PermissionStatus.granted) {
                  setState(() {
                    _loggedIn = true;
                  });
                }
                Navigator.pop(context);
              },
              child: customText(text: "allow"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: BackGreoundImageContainer(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 8,
              ),
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
                  if (_loggedIn)
                    Column(
                      children: [
                        Center(
                            child: Text(
                          "Home",
                          style: TextStyle(
                              color: titleColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 33),
                        )),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 22.0, bottom: 8.0, left: 8.0, right: 8.0),
                            child: SizedBox(
                                height: 570, child: FeatureContainer())),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar());
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
