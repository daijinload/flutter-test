import 'package:flutter_main/src/3_infrastructures/http/sample_api.dart'
    as sample_api;

Future<String> userInfo(String nanika) async {
  final result = await sample_api.getUserInfo();
  return result;
}
