import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';

class TitleBar extends StatelessWidget {
  final String theme;

  const TitleBar({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(theme == 'pink'
                  ? AppTheme.lightningLogoPink
                  : AppTheme.lightningLogoOrigin),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Jinie Builder',
          style: TextStyle(
            color: theme == 'pink' ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
