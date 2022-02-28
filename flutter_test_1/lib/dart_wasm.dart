import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_main/src/3_infrastructures/http/sample_api.dart';
import 'package:wasm/wasm.dart';
import 'dart:convert';
// import 'package:path/path.dart';

Future<String> getWasmData() async {

  // httpでファイルから取得する
  // await downloadWasm('aaa.wasm');

  // final data = File('/assets/aaa.wasm').readAsBytesSync();
  final byteData = await rootBundle.load('assets/images/aaa.wasm');
  final data = byteData.buffer.asUint8List();

  // final data = File('/tmp/aaa.wasm').readAsBytesSync();
  print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
  print(data);
  final mod = WasmModule(data);
  mod.createMemory(1);
  print(mod.describe());

  // captureStdout=trueだと、wasm内で標準出力しても出なくなる。本番はエラーだけ出すとか用？
  // final builder = mod.builder();
  final builder = mod.builder()..enableWasi(captureStdout: false, captureStderr: false);
  final inst = builder.build();

  // 引数値と返却値用の配列を初期化してから使う
  inst.lookupFunction('initMemoryParams')();

  // 動的に割り当てる方法がわからないため、関数input用の事前定義した配列のpointerを取得する。
  final inStrPtr = inst.lookupGlobal('inStrPtr')?.value;

  // 文字列を渡す必要があるが、Dartの文字列の扱いは割とrawな感じ。
  var inStrStart = inStrPtr;
  final inputBytes = utf8.encode('{"name":"eee"}');
  for (var inputByte in inputBytes) {
    inst.memory.view[inStrStart++] = inputByte;
  }

  // 関数を取得して実行する。
  // 現状では引数用の文字列領域を読み取って、nameを取得後、nameを2つにしたjsonを再作成し、
  // 返却用の配列に書き出して、その文字列のsizeを返す感じの処理。
  final ddd = inst.lookupFunction('ddd');
  final outStrPtr = inst.lookupGlobal('outStrPtr')?.value;

  final outputSize = ddd();
  final outputByteIterable = inst.memory.view.getRange(outStrPtr, outStrPtr + outputSize);
  final result = utf8.decode(outputByteIterable.toList());
  print(result);
  // for (var outputByte in outputByteIterable) {
  //   print(outputByte);
  // }

  // 返却値用の配列を初期化
  inst.lookupFunction('initMemoryParamOutput')();
  return result;
}
