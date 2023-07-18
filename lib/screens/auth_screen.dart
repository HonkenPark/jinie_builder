import 'package:flutter/material.dart';
import 'package:jinie_builder/features/diagonal_clipper.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/features/popup_notify.dart';
import 'package:jinie_builder/models/user_info.dart';
import 'package:jinie_builder/provider/theme_provider.dart';
import 'package:jinie_builder/screens/home_screen.dart';
import 'package:jinie_builder/screens/splash_screen.dart';
import 'package:jinie_builder/services/api_service.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  final ThemeStorage storage;
  const AuthScreen({
    Key? key,
    required this.storage,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late ThemeProvider _themeProvider;
  String theme = "";
  bool isUserInfoLoading = false;
  final TextEditingController _idController = TextEditingController();
  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    widget.storage.readTheme().then((int value) {
      setState(() {
        theme = value == 0 ? 'pink' : 'indigo';
        _themeProvider = ThemeProvider(theme);
      });
    });
  }

  moveToHomeScreen(String theme, UserInfo data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          index: 0,
          theme: theme,
          userInfo: data,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  showErrorCode(int code, String msg) {
    Navigator.of(context).push(PopupNotify<void>(
      title: '에러코드 $code.👀',
      content: msg,
      theme: theme,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context);
    theme = Provider.of<ThemeProvider>(context).theme;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            theme == 'pink' ? AppTheme.pinkWallpaper : AppTheme.indigoWallpaper,
          ),
          alignment: FractionalOffset.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          theme == 'pink'
                              ? AppTheme.lightningLogoWhite
                              : AppTheme.lightningLogoOrigin,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jinie Builder',
                          style: TextStyle(
                            color: theme == 'pink'
                                ? Colors.white
                                : AppTheme.indigoLightBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'LP Integration Build Tool',
                          style: TextStyle(
                            color: theme == 'pink'
                                ? AppTheme.pinkDarkRed
                                : AppTheme.indigoDarkBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ClipPath(
                clipper: DiagonalClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: theme == 'pink'
                        ? AppTheme.gradientPink
                        : AppTheme.gradientIndigo,
                  ),
                  height: MediaQuery.of(context).size.height - 150,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 200,
                      left: 100,
                      right: 100,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextField(
                          textInputAction: TextInputAction.go,
                          controller: _idController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your ID',
                            hintStyle: const TextStyle(
                              color: AppTheme.commonGrey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.5,
                                color: theme == 'pink'
                                    ? AppTheme.pinkGreen
                                    : AppTheme.indigoYellow,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: theme == 'pink'
                                    ? AppTheme.pinkGreen
                                    : AppTheme.indigoYellow,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                          ),
                          onSubmitted: (value) {
                            _getUserInfo();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: isUserInfoLoading ? null : _getUserInfo,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(400, 45),
                            backgroundColor: theme == 'pink'
                                ? AppTheme.pinkMint
                                : AppTheme.indigoYellow,
                            foregroundColor: theme == 'pink'
                                ? AppTheme.pinkStrongPink
                                : AppTheme.indigoDarkBlue,
                            shadowColor: Colors.black,
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.5,
                                color: theme == 'pink'
                                    ? AppTheme.pinkGreen
                                    : AppTheme.indigoYellow,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Authorization",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: theme == 'pink'
                                  ? AppTheme.pinkDarkGrey
                                  : AppTheme.indigoDarkGrey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                                color: theme == 'pink'
                                    ? AppTheme.pinkGreen
                                    : AppTheme.indigoYellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            child: Text(
                              'Change Theme',
                              style: TextStyle(
                                color: theme == 'pink'
                                    ? AppTheme.pinkGreen
                                    : AppTheme.indigoYellow,
                              ),
                            ),
                            onPressed: () {
                              _themeProvider.changeTheme();
                              int themeValue =
                                  _themeProvider.theme == 'pink' ? 0 : 1;
                              widget.storage.writeTheme(themeValue);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getUserInfo() async {
    final String userId = _idController.text;
    setState(() {
      isUserInfoLoading = true;
    });

    final user = await ApiService.getUserInfo(userId);
    if (user['code'] == 200) {
      moveToHomeScreen(theme, UserInfo.fromJson(user['msg'], userId));
    } else {
      showErrorCode(user['code'], user['msg']);
    }

    setState(() {
      isUserInfoLoading = false;
    });
  }
}
