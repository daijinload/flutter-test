import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

Future<String> getUserInfo() async {
  return await getApi("/");
}

// local mode
// const host = '127.0.0.1';
// android emulator
const host = '10.0.2.2';
const port = 8090;

Future<String> getApi(String path) async {
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.get(host, port, path);
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
    rethrow;
  } finally {
    client.close();
  }
}

Future<Uint8List> downloadWasm(String fileName) async {
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.get(host, port, '/wasm');
    HttpClientResponse response =
        await request.close().timeout(const Duration(seconds: 3));
    return await consolidateHttpClientResponseBytes(response);
  } finally {
    client.close();
  }
}

// ファイルをtmpに書き出すサンプル
// final bytes = await consolidateHttpClientResponseBytes(response);
// Directory tempDir = await getTemporaryDirectory();
// String tempPath = tempDir.path;
// File file = File('$tempPath/$fileName');
// File file = File('/tmp/$fileName');
// await file.writeAsBytes(bytes);
