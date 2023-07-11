import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';

enum EnvironMode { none, local, cloud }

class EnvironScreen extends StatefulWidget {
  const EnvironScreen({super.key});

  @override
  State<EnvironScreen> createState() => _EnvironScreenState();
}

class _EnvironScreenState extends State<EnvironScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Theme.of(context).primaryColor;
      }
      return Colors.white;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // backgroundColor: Color.fromRGBO(255, 222, 215, 1.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 120.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nice to see you, {user_name}🤗.\nPlease select the mode.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppTheme.pinkGreenSub,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      Icons.desktop_windows_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Local Mode',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      checkColor: AppTheme.pinkGreenSub,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (value) => {
                        setState(() {
                          isChecked = value!;
                        })
                      },
                    ),
                  ),
                  // Icon(Icons.check_box_outline_blank_rounded,
                  //     size: 40, color: Colors.grey.shade200),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppTheme.pinkGreenSub,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
              child: Stack(
                children: <Widget>[
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Icon(
                        Icons.cloud_done_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Cloud Mode',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Icon(
                        Icons.check_box_rounded,
                        size: 40,
                        color: Colors.grey.shade100,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
