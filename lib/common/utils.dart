import 'dart:convert';
import 'dart:io';

String convertPlatform(String code) {
  String ret = '';
  switch (code) {
    case 'stdg5_mobis':
      ret = '표준형5세대 (STD G5)';
      break;
    case 'stdg5w_mobis':
      ret = '표준형5세대 와이드 (STD G5 W)';
      break;
    case 'stdg5_lge':
      ret = '표준형5세대 (STD G5)';
      break;
    case 'stdg5w_lge':
      ret = '표준형5세대 와이드 (STD G5 W)';
      break;
    case 'ccic':
      ret = 'CCIC (CCIC)';
      break;
    case 'prm5':
      ret = '고급형5세대 (PRM5)';
      break;
    case 'prm6':
      ret = '고급형6세대 (PRM6)';
      break;
    default:
      ret = 'none';
      break;
  }
  return ret;
}

String convertBuildMode(String code) {
  String ret = '';
  switch (code) {
    case 'dm':
      ret = 'DM Build';
      break;
    case 'lm':
      ret = 'LM Build';
      break;
    default:
      ret = 'Undefined';
      break;
  }
  return ret;
}

Future<String> loadSupportLangJson() async {
  File file = File('assets/json/supportLangByCv.json');
  return await file.readAsString();
}

Future<List<String>> setLangByPlatform(String cv, String platform) async {
  String jsonData = await loadSupportLangJson();
  Map<String, dynamic> data = jsonDecode(jsonData);

  if (data.containsKey(cv) && data[cv].containsKey(platform)) {
    return List<String>.from(data[cv][platform]);
  } else {
    return [];
  }
}
