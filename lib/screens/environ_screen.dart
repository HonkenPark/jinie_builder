import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/features/checkbox_color.dart';
import 'package:jinie_builder/models/user_info.dart';

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
  late int environMode;
  late String theme;
  late UserInfo userInfo;
  late String selectedFolderPath;

  @override
  void initState() {
    environMode = EnvironMode.none.index;
    theme = widget.theme;
    userInfo = widget.userInfo;
    selectedFolderPath = 'NONE';
    super.initState();
  }

  Color getColor(Set<MaterialState> states) => getCheckboxColor(states, theme);

  @override
  Widget build(BuildContext context) {
    void pickFolder() async {
      String? result = await FilePicker.platform.getDirectoryPath();
      if (result != null) {
        setState(() {
          selectedFolderPath = result;
          print(selectedFolderPath);
        });
      }
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
                            value: environMode == EnvironMode.local.index,
                            onChanged: (value) => {
                              setState(() {
                                if (value!) {
                                  environMode = EnvironMode.local.index;
                                } else {
                                  environMode = EnvironMode.none.index;
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
                            value: environMode == EnvironMode.cloud.index,
                            onChanged: (value) => {
                              setState(() {
                                if (value!) {
                                  environMode = EnvironMode.cloud.index;
                                } else {
                                  environMode = EnvironMode.none.index;
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
                        fontSize: 15,
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
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    const Text(
                      'Path:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(selectedFolderPath),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
