import 'package:flutter_main/src/3_infrastructures/http/roomon_api.dart'
    as roomon_api;

Future<String> userInfo(String nanika) async {
  final result = await roomon_api.getUserInfo();
  return result;
}
