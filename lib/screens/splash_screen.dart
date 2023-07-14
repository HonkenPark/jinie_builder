import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:jinie_builder/provider/theme_provider.dart';
import 'package:jinie_builder/screens/auth_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ThemeStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/jinie_builder_theme.txt');
  }

  Future<int> readTheme() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return -1;
    }
  }

  Future<File> writeTheme(int myTheme) async {
    final file = await _localFile;
    return file.writeAsString('$myTheme');
  }
}

class SplashScreen extends StatefulWidget {
  final ThemeStorage storage;
  const SplashScreen({
    super.key,
    required this.storage,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var opacitiValue = 0.0;

  @override
  void initState() {
    super.initState();
    widget.storage.readTheme().then((int value) {
      setState(() {
        opacitiValue = 1.0;
        Timer(const Duration(milliseconds: 4000), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => ThemeProvider(
                  value == 0
                      ? 'pink'
                      : value == 1
                          ? 'indigo'
                          : 'pink',
                ),
                child: AuthScreen(
                  storage: widget.storage,
                ),
              ),
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const String groupLogo = 'assets/group_logo.png';

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black54,
                  Colors.white70,
                  Colors.black54,
                ],
              ),
            ),
            child: AnimatedOpacity(
              opacity: opacitiValue,
              duration: const Duration(seconds: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(groupLogo),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Text(
                    'MZLP',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MichromaRegular',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
