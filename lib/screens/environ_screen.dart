import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/widgets/process_menu_navigation.dart';
import 'package:jinie_builder/widgets/title_bar.dart';

enum EnvironMode { none, local, cloud }

class EnvironScreen extends StatefulWidget {
  const EnvironScreen({super.key});

  @override
  State<EnvironScreen> createState() => _EnvironScreenState();
}

class _EnvironScreenState extends State<EnvironScreen> {
  late int environMode;

  @override
  void initState() {
    environMode = EnvironMode.none.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return 'pink' == 'pink'
            ? AppTheme.pinkStrongPink
            : AppTheme.indigoYellow;
      }
      return 'pink' == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoDeepBlue;
    }

    return Scaffold(
      appBar: AppBar(
        title: const TitleBar(theme: "pink"),
        toolbarHeight: 70,
        backgroundColor:
            'pink' == 'pink' ? AppTheme.pinkMint : AppTheme.indigoDeepBlue,
      ),
      backgroundColor: Colors.transparent,
      // backgroundColor: Color.fromRGBO(255, 222, 215, 1.0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: 'pink' == 'pink'
              ? AppTheme.gradientPink
              : AppTheme.gradientIndigo,
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
                      color: 'pink' == 'pink'
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
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Icon(
                          Icons.desktop_windows_outlined,
                          size: 40,
                          color: 'pink' == 'pink'
                              ? AppTheme.pinkGreen
                              : AppTheme.indigoDeepBlue,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Local Mode',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: 'pink' == 'pink'
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
                      color: 'pink' == 'pink'
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
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Icon(
                          Icons.cloud_done_outlined,
                          size: 50,
                          color: 'pink' == 'pink'
                              ? AppTheme.pinkGreen
                              : AppTheme.indigoDeepBlue,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Cloud Mode',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: 'pink' == 'pink'
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ProcessMenuNavigation(
        index: 4,
      ),
    );
  }
}