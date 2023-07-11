import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/features/popup_notify.dart';

class ProcessMenuNavigation extends StatefulWidget {
  final int index;

  const ProcessMenuNavigation({
    super.key,
    required this.index,
  });

  @override
  State<ProcessMenuNavigation> createState() => _ProcessMenuNavigation();
}

class _ProcessMenuNavigation extends State<ProcessMenuNavigation> {
  int _selectedIndex = 0;
  bool isEssentialSet = true;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'mode content',
      style: optionStyle,
    ),
    Text(
      'platform content',
      style: optionStyle,
    ),
    Text(
      'parameter content',
      style: optionStyle,
    ),
    Text(
      'languages content',
      style: optionStyle,
    ),
    Text(
      'environment content',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  void _onItemTapped(int index) {
    if (!isEssentialSet) {
      if (index != 0 && index != 1) {
        Navigator.of(context).push(PopupNotify<void>(
          title: '사전 설정이 필요합니다.👀',
          content: "빌드모드 또는 플랫폼을 먼저 선택해주세요.🙂",
          theme: 'pink',
        ));
        return;
      }
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
            backgroundColor: 'pink' == 'pink'
                ? AppTheme.pinkLightPink
                : AppTheme.indigoDeepBlue),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'PLATFORM',
            backgroundColor: 'pink' == 'pink'
                ? AppTheme.pinkLightPink
                : AppTheme.indigoDeepBlue),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check),
            label: 'PARAMS',
            backgroundColor: 'pink' == 'pink'
                ? AppTheme.pinkLightPink
                : AppTheme.indigoDeepBlue),
        BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'LANGUAGES',
            backgroundColor: 'pink' == 'pink'
                ? AppTheme.pinkLightPink
                : AppTheme.indigoDeepBlue),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ENVIRON',
            backgroundColor: 'pink' == 'pink'
                ? AppTheme.pinkLightPink
                : AppTheme.indigoDeepBlue),
      ],
      currentIndex: _selectedIndex,
      showUnselectedLabels: true,
      iconSize: 42.0,
      selectedItemColor:
          'pink' == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoYellow,
      unselectedItemColor:
          'pink' == 'pink' ? AppTheme.pinkStrongPink : AppTheme.indigoLightBlue,
      onTap: _onItemTapped,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
