import 'package:flutter/material.dart';

enum EnvironMode { none, local, cloud }

class ButtonEnvironMode extends StatefulWidget {
  const ButtonEnvironMode({super.key});

  @override
  State<ButtonEnvironMode> createState() => _ButtonEnvironModeState();
}

class _ButtonEnvironModeState extends State<ButtonEnvironMode> {
  late int environMode;

  @override
  void initState() {
    environMode = EnvironMode.none.index;
    super.initState();
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
        return Theme.of(context).primaryColor;
      }
      return Colors.white;
    }

    return const Placeholder();
  }
}
