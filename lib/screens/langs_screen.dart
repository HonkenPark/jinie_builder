import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/widgets/parameters_list.dart';

class LangsScreen extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const LangsScreen({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<LangsScreen> createState() => _LangsScreen();
}

class _LangsScreen extends State<LangsScreen> {
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

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
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please check languages.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ParametersList(
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
