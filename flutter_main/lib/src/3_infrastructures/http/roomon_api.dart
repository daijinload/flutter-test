import 'dart:async';
import 'dart:io';
import 'dart:convert';

// void main() async {
//   // final stringData = await getApi("/");
//   // print(stringData);
//   final stringData = await getUserInfo();
//   print(stringData);
// }
// void main() async {
//   var client = HttpClient();
//   try {
//     HttpClientRequest request = await client.get('localhost', 8090, '/');
//     HttpClientResponse response = await request.close();
//     final stringData = await response.transform(utf8.decoder).join();
//     // ignore: avoid_print
//     print(stringData);
//   } finally {
//     client.close();
//   }
// }

Future<String> getUserInfo() async {
  return await getApi("/");
}

Future<String> getApi(String path) async {
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.get('127.0.0.1', 8090, path);
    HttpClientResponse response =
        await request.close().timeout(const Duration(seconds: 3));
    final stringData = await response.transform(utf8.decoder).join();
    // print(stringData.toString());
    return stringData.toString();
  } on TimeoutException catch (_) {
    // A timeout occurred.
    rethrow;
  } on SocketException catch (_) {
    // Other exception
    rethrow;
  } finally {
    client.close();
  }
}

// feature<string> pumpWidget() {
//     return "";
// }
//  （1）定義に沿った関数例
// String helloWorld1(String world){
//   return 'Hello $world';
// }
// //  （2）戻り値と引数の型定義を省略
// helloWorld2(world){
//   return 'Hello $world';
// }
// //  （3） 1行関数での記述例
// String helloWorld4(String world) => 'Hello $world';

// //  （4）戻り値がいらない場合
// void helloWorld3(){
//   print('Hello');
// }
