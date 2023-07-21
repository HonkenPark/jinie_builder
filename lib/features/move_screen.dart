import 'package:flutter/material.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/screens/home_screen.dart';

class MoveScreen {
  final BuildContext context;
  final String theme;
  final UserInfo data;

  const MoveScreen({
    required this.context,
    required this.theme,
    required this.data,
  });

  moveToHomeScreen(String theme, UserInfo data) {
    print('hello');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          index: 0,
          theme: theme,
          userInfo: data,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
