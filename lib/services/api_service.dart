import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jinie_builder/models/user_info.dart';

class ApiService {
  static const String baseUrl = "http://192.168.123.60:30001";
  static const String login = "login";
  static const String update = "update";

  static const headers = {'Content-Type': 'application/json'};

  static Future<Map<String, dynamic>> getUserInfo(userId) async {
    final response = jsonEncode({'code': 0, 'msg': {}});
    Map<String, dynamic> resDataObj = jsonDecode(response);
    final body = jsonEncode(
      {'user_id': userId, 'user_pw': '1234'},
    );
    final url = Uri.parse('$baseUrl/$login');

    try {
      final data = await http.post(url, headers: headers, body: body);
      if (data.statusCode == 200) {
        resDataObj['msg'] = jsonDecode(data.body);
      } else {
        resDataObj['msg'] = data.body;
      }
      resDataObj['code'] = data.statusCode;
      return resDataObj;
    } catch (e, stackTrace) {
      resDataObj['code'] = 500;
      resDataObj['msg'] = 'POST실패, 백엔드서버 확인이 필요합니다.';
      print('$e\n$stackTrace');
      return resDataObj;
    }
  }

  static Future<Map<String, dynamic>> setUserInfo(UserInfo userInfo) async {
    final response = jsonEncode({'code': 0, 'msg': {}});
    Map<String, dynamic> resDataObj = jsonDecode(response);
    final body = jsonEncode(
      userInfo.toJson(),
    );
    final url = Uri.parse('$baseUrl/$update');

    try {
      final data = await http.post(url, headers: headers, body: body);
      if (data.statusCode == 200) {
        resDataObj['msg'] = jsonDecode(data.body);
      } else {
        resDataObj['msg'] = data.body;
      }
      resDataObj['code'] = data.statusCode;
      return resDataObj;
    } catch (e, stackTrace) {
      resDataObj['code'] = 500;
      resDataObj['msg'] = 'POST실패, 백엔드서버 확인이 필요합니다.';
      print('$e\n$stackTrace');
      return resDataObj;
    }
  }
}
