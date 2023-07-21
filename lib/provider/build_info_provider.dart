import 'package:flutter/material.dart';
import 'package:jinie_builder/models/user_info.dart';

class BuildInfoProvider extends ChangeNotifier {
  String _mode, _vendor, _platform, _environ;
  final Map<String, bool> _params;
  final Map<String, List<String>> _langs;
  final UserInfo _userInfo;

  BuildInfoProvider(
    this._mode,
    this._vendor,
    this._platform,
    this._environ,
    this._params,
    this._langs,
    this._userInfo,
  );

  set mode(value) => _mode = value;
  set vendor(value) => _vendor = value;
  set platform(value) => _platform = value;
  set environ(value) => _environ = value;

  void setParams(Map<String, bool> param) {
    _params.addAll(param);
  }

  void setLangs(Map<String, List<String>> lang) {
    _langs.addAll(lang);
  }

  String get mode => _mode;
  String get vendor => _vendor;
  String get platform => _platform;
  String get environ => _environ;

  Map<String, bool> get params => _params;
  Map<String, List<String>> get langs => _langs;

  @override
  notifyListeners();
}
