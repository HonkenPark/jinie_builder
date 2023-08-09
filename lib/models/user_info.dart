class UserInfo {
  String id, name, grade, team;
  String buildpath, mode, engine, all, environ, vendor, platform;
  Map<String, dynamic> params;
  Map<String, dynamic> langs;

  UserInfo.fromJson(Map<String, dynamic> json, String userId)
      : id = userId,
        name = json[userId]['name'],
        grade = json[userId]['grade'],
        team = json[userId]['team'],
        buildpath = json[userId]['build_info']['buildpath'],
        mode = json[userId]['build_info']['mode'],
        engine = json[userId]['build_info']['engine'],
        all = json[userId]['build_info']['ALL'],
        environ = json[userId]['build_info']['environ'],
        vendor = json[userId]['build_info']['vendor'],
        platform = json[userId]['build_info']['platform'],
        langs = json[userId]['build_info']['langs'],
        params = json[userId]['build_info']['params'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'grade': grade,
      'team': team,
      'build_info': {
        'buildpath': buildpath,
        'mode': mode,
        'engine': engine,
        'ALL': all,
        'environ': environ,
        'vendor': vendor,
        'platform': platform,
        'langs': langs,
        'params': params,
      },
    };
  }

  List<String> getBatchFileArguments() {
    Map<String, dynamic> buildInfo = toJson()['build_info'];
    List<String> arguments = [
      'buildpath',
      buildInfo['buildpath'],
      'ALL',
      buildInfo['ALL'],
    ];

    buildInfo['params'][vendor].forEach((key, value) {
      arguments.add('$key');
      arguments.add(value.toString());
    });

    buildInfo['langs'][vendor].forEach((key, value) {
      arguments.add('$key');
      arguments.add(value.toString().replaceAll(RegExp(r'[\[\],]'), ''));
    });
    return arguments;
  }

  String get getName => name;
  String get getVendor => vendor;
  String get getPlatform => platform;
  String get getEnviron => environ;
  String get getEngine => engine;

  void setMode(String value) => mode = value;
  void setEngine(String value) => engine = value;
}
