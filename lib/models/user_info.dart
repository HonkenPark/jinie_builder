class UserInfo {
  final String name, grade, team;
  final String mode, environ, vendor, platform;
  final List<dynamic> lang;
  final List<dynamic> param;

  UserInfo.fromJson(Map<String, dynamic> json, String userId)
      : name = json[userId]['name'],
        grade = json[userId]['grade'],
        team = json[userId]['team'],
        mode = json[userId]['last_info']['mode'],
        environ = json[userId]['last_info']['environ'],
        vendor = json[userId]['last_info']['vendor'],
        platform = json[userId]['last_info']['platform'],
        lang = json[userId]['last_info']['lang'],
        param = json[userId]['last_info']['param'];
}
