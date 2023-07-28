import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';

class ParametersList extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const ParametersList({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<ParametersList> createState() => _ParametersList();
}

class _ParametersList extends State<ParametersList> {
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

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 3.0,
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0;
                i < userInfo.params[userInfo.vendor].length ~/ 2;
                i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int j = 0; j < 2; j++)
                    Expanded(
                      child: SwitchListTile(
                        thumbIcon: thumbIcon,
                        activeColor: theme == 'pink'
                            ? AppTheme.pinkGreen
                            : AppTheme.indigoYellow,
                        title: Text(
                          userInfo.params[userInfo.vendor].keys
                              .elementAt(i * 2 + j),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        value: userInfo.params[userInfo.vendor][userInfo
                                    .params[userInfo.vendor].keys
                                    .elementAt(i * 2 + j)] ==
                                1
                            ? true
                            : false,
                        onChanged: (value) {
                          setState(() {
                            value
                                ? userInfo.params[userInfo.vendor][userInfo
                                    .params[userInfo.vendor].keys
                                    .elementAt(i * 2 + j)] = 1
                                : userInfo.params[userInfo.vendor][userInfo
                                    .params[userInfo.vendor].keys
                                    .elementAt(i * 2 + j)] = 0;
                          });
                        },
                      ),
                    ),
                ],
              ),
            if (userInfo.params[userInfo.vendor].length % 2 != 0)
              Row(
                children: [
                  Expanded(
                    child: SwitchListTile(
                      thumbIcon: thumbIcon,
                      activeColor: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoYellow,
                      title: Text(
                        userInfo.params[userInfo.vendor].keys.elementAt(
                            userInfo.params[userInfo.vendor].length - 1),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: userInfo.params[userInfo.vendor][userInfo
                                  .params[userInfo.vendor].keys
                                  .elementAt(
                                      userInfo.params[userInfo.vendor].length -
                                          1)] ==
                              1
                          ? true
                          : false,
                      onChanged: (value) {
                        setState(() {
                          value
                              ? userInfo.params[userInfo.vendor][userInfo
                                  .params[userInfo.vendor].keys
                                  .elementAt(
                                      userInfo.params[userInfo.vendor].length -
                                          1)] = 1
                              : userInfo.params[userInfo.vendor][userInfo
                                  .params[userInfo.vendor].keys
                                  .elementAt(userInfo.params[userInfo.vendor].length - 1)] = 0;
                        });
                      },
                    ),
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                ],
              )
            else
              const Row(
                children: [
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
