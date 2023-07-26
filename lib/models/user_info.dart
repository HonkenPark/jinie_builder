class UserInfo {
  String name, grade, team;
  String path, mode, environ, vendor, platform;
  Map<String, dynamic> params;
  Map<String, dynamic> langs;

  UserInfo.fromJson(Map<String, dynamic> json, String userId)
      : name = json[userId]['name'],
        grade = json[userId]['grade'],
        team = json[userId]['team'],
        path = json[userId]['build_info']['path'],
        mode = json[userId]['build_info']['mode'],
        environ = json[userId]['build_info']['environ'],
        vendor = json[userId]['build_info']['vendor'],
        platform = json[userId]['build_info']['platform'],
        langs = json[userId]['build_info']['langs'],
        params = json[userId]['build_info']['params'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'grade': grade,
      'team': team,
      'build_info': {
        'path': path,
        'mode': mode,
        'environ': environ,
        'vendor': vendor,
        'platform': platform,
        'langs': langs,
        'params': params,
      },
    };
  }

  String get getName => name;
  String get getVendor => vendor;
  String get getPlatform => platform;
  String get getEnviron => environ;

  void setMode(String value) => mode = value;
}
