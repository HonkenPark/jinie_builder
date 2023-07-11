import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jinie_builder/provider/theme_provider.dart';
import 'package:jinie_builder/screens/auth_screen.dart';
// import 'package:jinie_builder/screens/home_screen.dart';
// import 'package:jinie_builder/screens/environ_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => ThemeProvider(),
        child: const AuthScreen(),
      ),
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => ThemeProvider(),
      //   child: const HomeScreen(),
      // ),
    );
  }
}
