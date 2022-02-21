import 'dart:async';
import 'dart:io';
import 'dart:convert';

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
  // ignore: unused_catch_stack
  } on SocketException catch (_err, _stackTrace) {
    // print(err);
    // print(stacktrace);
    // Other exception
    rethrow;
  } finally {
    client.close();
  }
}
