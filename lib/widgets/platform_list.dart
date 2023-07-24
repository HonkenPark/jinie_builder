import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/common/utils.dart';
import 'package:jinie_builder/models/user_info.dart';

class PlatformList extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const PlatformList({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<PlatformList> createState() => _PlatformListState();
}

class _PlatformListState extends State<PlatformList> {
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
      child: userInfo.vendor == "mobis"
          ? Column(
              children: [
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: Text(
                          convertPlatform('stdg5_mobis'),
                          style: const TextStyle(
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
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: userInfo.platform == "stdg5_mobis",
                          onChanged: (value) {
                            if (value!) {
                              checkPlatform("stdg5_mobis");
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: Text(
                          convertPlatform('stdg5w_mobis'),
                          style: const TextStyle(
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
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
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
            )
          : userInfo.vendor == "lge"
              ? Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              convertPlatform('stdg5_lge'),
                              style: const TextStyle(
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
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: userInfo.platform == "stdg5_lge",
                              onChanged: (value) {
                                if (value!) {
                                  checkPlatform("stdg5_lge");
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              convertPlatform('stdg5w_lge'),
                              style: const TextStyle(
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
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: userInfo.platform == "stdg5w_lge",
                              onChanged: (value) {
                                if (value!) {
                                  checkPlatform("stdg5w_lge");
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              convertPlatform('prm5'),
                              style: const TextStyle(
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
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: userInfo.platform == "prm5",
                              onChanged: (value) {
                                if (value!) {
                                  checkPlatform("prm5");
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              convertPlatform('prm6'),
                              style: const TextStyle(
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
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: userInfo.platform == "prm6",
                              onChanged: (value) {
                                if (value!) {
                                  checkPlatform("prm6");
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Text(
                              convertPlatform('ccic'),
                              style: const TextStyle(
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
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: userInfo.platform == "ccic",
                              onChanged: (value) {
                                if (value!) {
                                  checkPlatform("ccic");
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
                )
              : const SizedBox.shrink(),
    );
  }
}
