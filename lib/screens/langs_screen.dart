import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/widgets/country_language_list.dart';

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
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width:
                        userInfo.vendor == "mobis" || userInfo.vendor == "lge"
                            ? 3.0
                            : 0,
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
                  ],
                ),
                child: CountryLanguageList(
                  theme: theme,
                  userInfo: userInfo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
