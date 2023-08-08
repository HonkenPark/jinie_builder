import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';

class EngineList extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const EngineList({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<EngineList> createState() => _EngineListState();
}

class _EngineListState extends State<EngineList> {
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  checkPlatform(String mode) {
    setState(() {
      userInfo.platform = mode;
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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width:
              userInfo.vendor == "mobis" || userInfo.vendor == "lge" ? 3.0 : 0,
          color: theme == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoYellow,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(10, 10),
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: Text(
                    '세렌스 엔진 (Cerence Engine)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    right: 10,
                  ),
                  child: Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: userInfo.platform == "stdg5w_mobis",
                    onChanged: (value) {
                      if (value!) {
                        checkPlatform("stdg5w_mobis");
                      } else {
                        checkPlatform("none");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    '사운드하운드 엔진 (SoundHound Engine)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: userInfo.platform == "stdg5w_mobis",
                    onChanged: (value) {
                      if (value!) {
                        checkPlatform("stdg5w_mobis");
                      } else {
                        checkPlatform("none");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
