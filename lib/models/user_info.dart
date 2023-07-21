class UserInfo {
  String name, grade, team;
  String mode, environ, vendor, platform;
  Map<String, dynamic> params;
  Map<String, dynamic> langs;

  UserInfo.fromJson(Map<String, dynamic> json, String userId)
      : name = json[userId]['name'],
        grade = json[userId]['grade'],
        team = json[userId]['team'],
        mode = json[userId]['build_info']['mode'],
        environ = json[userId]['build_info']['environ'],
        vendor = json[userId]['build_info']['vendor'],
        platform = json[userId]['build_info']['platform'],
        langs = json[userId]['build_info']['langs'],
        params = json[userId]['build_info']['params'];

  String get getName => name;
  String get getVendor => vendor;
  String get getPlatform => platform;
  String get getEnviron => environ;

  void setMode(String value) => mode = value;
}
