import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';

enum BuildMode { none, dm, lm }

class ModeScreen extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const ModeScreen({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<ModeScreen> createState() => _ModeScreen();
}

class _ModeScreen extends State<ModeScreen> {
  late int buildMode;
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    buildMode = BuildMode.none.index;
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  checkState(BuildMode mode) {
    setState(() {
      buildMode = mode.index;
    });
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
      backgroundColor: Colors.transparent,
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
                            value: buildMode == BuildMode.dm.index,
                            onChanged: (value) => {
                              if (value!)
                                {checkState(BuildMode.dm)}
                              else
                                {checkState(BuildMode.none)}
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
                            value: buildMode == BuildMode.lm.index,
                            onChanged: (value) => {
                              if (value!)
                                {checkState(BuildMode.lm)}
                              else
                                {checkState(BuildMode.none)}
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
    );
  }
}
