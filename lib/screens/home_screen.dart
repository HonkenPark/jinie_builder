import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/screens/params_screen.dart';
import 'package:jinie_builder/screens/platform_screen.dart';
import 'package:jinie_builder/widgets/title_bar.dart';
import 'package:jinie_builder/screens/mode_screen.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  final String theme;
  final UserInfo userInfo;

  const HomeScreen({
    super.key,
    required this.index,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late int bottomNavBarIndex;
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    bottomNavBarIndex = widget.index;
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      ModeScreen(
        theme: theme,
        userInfo: userInfo,
      ),
      PlatformScreen(
        theme: theme,
        userInfo: userInfo,
      ),
      ParamsScreen(
        theme: theme,
        userInfo: userInfo,
      ),
      const Text(
        'LangScreen',
      ),
      const Text(
        'EnvironScreen',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: TitleBar(theme: theme),
        toolbarHeight: 70,
        backgroundColor:
            theme == 'pink' ? AppTheme.pinkMint : AppTheme.indigoDeepBlue,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: widgetOptions.elementAt(bottomNavBarIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'HOME',
              backgroundColor: theme == 'pink'
                  ? AppTheme.pinkLightPink
                  : AppTheme.indigoDeepBlue),
          BottomNavigationBarItem(
              icon: const Icon(Icons.directions_car),
              label: 'PLATFORM',
              backgroundColor: theme == 'pink'
                  ? AppTheme.pinkLightPink
                  : AppTheme.indigoDeepBlue),
          BottomNavigationBarItem(
              icon: const Icon(Icons.library_add_check),
              label: 'PARAMS',
              backgroundColor: theme == 'pink'
                  ? AppTheme.pinkLightPink
                  : AppTheme.indigoDeepBlue),
          BottomNavigationBarItem(
              icon: const Icon(Icons.language),
              label: 'LANGUAGES',
              backgroundColor: theme == 'pink'
                  ? AppTheme.pinkLightPink
                  : AppTheme.indigoDeepBlue),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'ENVIRON',
              backgroundColor: theme == 'pink'
                  ? AppTheme.pinkLightPink
                  : AppTheme.indigoDeepBlue),
        ],
        currentIndex: bottomNavBarIndex,
        showUnselectedLabels: true,
        iconSize: 42.0,
        selectedItemColor:
            theme == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoYellow,
        unselectedItemColor: theme == 'pink'
            ? AppTheme.pinkStrongPink
            : AppTheme.indigoLightBlue,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
