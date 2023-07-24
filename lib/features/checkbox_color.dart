import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';

Color getCheckboxColor(Set<MaterialState> states, String theme) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return theme == 'pink' ? AppTheme.pinkStrongPink : AppTheme.indigoYellow;
  }
  return theme == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoDeepBlue;
}
