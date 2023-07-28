import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/common/utils.dart';
import 'package:jinie_builder/features/checkbox_color.dart';
import 'package:jinie_builder/features/popup_notify.dart';
import 'package:jinie_builder/models/user_info.dart';

class ButtonCheckboxMode extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const ButtonCheckboxMode({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<ButtonCheckboxMode> createState() => _ButtonCheckboxModeState();
}

class _ButtonCheckboxModeState extends State<ButtonCheckboxMode> {
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  Color getColor(Set<MaterialState> states) => getCheckboxColor(states, theme);

  checkState(String mode) {
    setState(() {
      userInfo.mode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 2.0,
              color:
                  theme == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoYellow,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(10, 10),
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  convertBuildMode('dm'),
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
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: userInfo.mode == 'dm',
                      onChanged: (value) => {
                        if (value!) {checkState('dm')} else {checkState('none')}
                      },
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
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 2.0,
              color:
                  theme == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoYellow,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(10, 10),
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  convertBuildMode('lm'),
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
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: userInfo.mode == 'lm',
                      onChanged: (value) => {
                        // if (value!) {checkState('lm')} else {checkState('none')}
                        //TODO: 임시코드
                        Navigator.of(context).push(PopupNotify<void>(
                          title: 'Under construction ⛔',
                          content: '추후 지원될 예정입니다.',
                          theme: theme,
                        )),
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
