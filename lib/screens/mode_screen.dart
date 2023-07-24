import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/features/checkbox_color.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/widgets/button_checkbox_mode.dart';

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
              ButtonCheckboxMode(
                theme: theme,
                userInfo: userInfo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
