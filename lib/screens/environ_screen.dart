import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/features/checkbox_color.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/features/spin_loader.dart';
// import 'package:jinie_builder/services/api_service.dart';

enum EnvironMode { none, local, cloud }

class EnvironScreen extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const EnvironScreen({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<EnvironScreen> createState() => _EnvironScreenState();
}

class _EnvironScreenState extends State<EnvironScreen> {
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  Color getColor(Set<MaterialState> states) => getCheckboxColor(states, theme);

  @override
  Widget build(BuildContext context) {
    Future<void> runBuild() async {
      //TODO: 1. Loading Screen, 2. Run Batch file WITH ARGUMENTS 3. Request User Info Backend to Saving into DB)
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return IgnorePointer(
            ignoring: false,
            child: SpinLoader(
              theme: theme,
            ),
          );
        },
      );

      var filePath = '${userInfo.path}\\DM_Build_Option.bat';
      // var filePath = r'D:\dev\git\flutter\jinie_builder\build\windows\runner\Release\jinie_builder.exe';
      // var filePath = r'D:\dev\work\LPBatch\test1.bat';
      print(filePath);
      final process = await Process.start(filePath, []);
      process.stdout.transform(utf8.decoder).listen((data) {
        print('stdout: $data');
      });
      process.stderr.transform(utf8.decoder).listen((data) {
        print('stderr: $data');
      });
      final exitCode = await process.exitCode;
      print('Exit code: $exitCode');

      // final res = await ApiService.setUserInfo(userInfo);
      // if (res['code'] == 200) {
      //   print("Update Finish");
      // } else {
      //   print("${res['code']} + ${res['msg']}");
      // }
    }

    void pickFolder() async {
      // file_selector package
      final String? directoryPath = await getDirectoryPath();
      if (directoryPath != null) {
        setState(() {
          userInfo.path = directoryPath;
        });
      }

      // file_picker package
      // String? result = await FilePicker.platform.getDirectoryPath();
      // if (result != null) {
      //   setState(() {
      //     userInfo.path = result;
      //     print(userInfo.path);
      //   });
      // }

      // filesystem package
      // Create sample directory if not exists
      // String? path = await FilesystemPicker.open(
      //   title: 'Save to folder',
      //   context: context,
      //   rootDirectory: Directory('D:\\'),
      //   fsType: FilesystemType.folder,
      //   pickText: 'Select This Folder',
      // );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      // backgroundColor: Color.fromRGBO(255, 222, 215, 1.0),
      body: Container(
        decoration: BoxDecoration(
          gradient:
              theme == 'pink' ? AppTheme.gradientPink : AppTheme.gradientIndigo,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please select build environment.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2.0,
                      color: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoYellow,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ]),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Icon(
                          Icons.desktop_windows_outlined,
                          size: 40,
                          color: theme == 'pink'
                              ? AppTheme.pinkGreen
                              : AppTheme.indigoDeepBlue,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Local Mode',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: theme == 'pink'
                              ? AppTheme.pinkGreen
                              : AppTheme.indigoDeepBlue,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: userInfo.environ ==
                                EnvironMode.local.toString(),
                            onChanged: (value) => {
                              setState(() {
                                if (value!) {
                                  userInfo.environ =
                                      EnvironMode.local.toString();
                                } else {
                                  userInfo.environ =
                                      EnvironMode.none.toString();
                                }
                              })
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2.0,
                      color: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoYellow,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ]),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Icon(
                          Icons.cloud_done_outlined,
                          size: 50,
                          color: theme == 'pink'
                              ? AppTheme.pinkGreen
                              : AppTheme.indigoDeepBlue,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Cloud Mode',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: theme == 'pink'
                              ? AppTheme.pinkGreen
                              : AppTheme.indigoDeepBlue,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: userInfo.environ ==
                                EnvironMode.cloud.toString(),
                            onChanged: (value) => {
                              setState(() {
                                if (value!) {
                                  userInfo.environ =
                                      EnvironMode.cloud.toString();
                                } else {
                                  userInfo.environ =
                                      EnvironMode.none.toString();
                                }
                              })
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              userInfo.environ == EnvironMode.local.toString()
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Please set your \'LP Tools\' path\n(ex. D:\\data\\LP Tools)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: theme == 'pink'
                                    ? AppTheme.pinkDarkGrey
                                    : Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            ElevatedButton(
                              onPressed: pickFolder,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme == 'pink'
                                    ? AppTheme.pinkMint
                                    : AppTheme.indigoYellow,
                                foregroundColor: theme == 'pink'
                                    ? AppTheme.pinkStrongPink
                                    : AppTheme.indigoDarkBlue,
                                shadowColor: Colors.black,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.5,
                                    color: theme == 'pink'
                                        ? AppTheme.pinkGreen
                                        : AppTheme.indigoYellow,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'SET',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: theme == 'pink'
                                      ? AppTheme.pinkDarkGrey
                                      : AppTheme.indigoDarkGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Text(
                                'Path:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(
                                        255, 206, 206, 206),
                                  ),
                                  child: Text(
                                    userInfo.path,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 80, 80, 80),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        userInfo.path.isNotEmpty
                            ? ElevatedButton(
                                onPressed: runBuild,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme == 'pink'
                                      ? AppTheme.pinkGreen
                                      : AppTheme.indigoYellow,
                                  foregroundColor: theme == 'pink'
                                      ? AppTheme.pinkStrongPink
                                      : AppTheme.indigoDarkBlue,
                                  shadowColor: Colors.black,
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.7,
                                    MediaQuery.of(context).size.height * 0.07,
                                  ),
                                ),
                                child: Text(
                                  'BUILD',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: theme == 'pink'
                                        ? Colors.white
                                        : AppTheme.indigoDeepBlue,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
