import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/widgets/process_menu_navigation.dart';
import 'package:jinie_builder/widgets/title_bar.dart';

enum EnvironMode { none, local, cloud }

class HomeScreen extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;
  const HomeScreen({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late int environMode;
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    environMode = EnvironMode.none.index;
    theme = widget.theme;
    userInfo = widget.userInfo;
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
        return theme == 'pink'
            ? AppTheme.pinkStrongPink
            : AppTheme.indigoYellow;
      }
      return theme == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoDeepBlue;
    }

    return Scaffold(
      appBar: AppBar(
        title: TitleBar(theme: theme),
        toolbarHeight: 70,
        backgroundColor:
            theme == 'pink' ? AppTheme.pinkMint : AppTheme.indigoDeepBlue,
      ),
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
              Text(
                'Nice to see you,\n${userInfo.name} ${userInfo.grade}님🤗 (${userInfo.team})\n\nPlease select the build mode.',
                style: const TextStyle(
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
                      alignment: Alignment.center,
                      child: Text(
                        'DM Build',
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
                      alignment: Alignment.center,
                      child: Text(
                        'LM Mode',
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProcessMenuNavigation(
        index: 0,
        theme: theme,
      ),
    );
  }
}
