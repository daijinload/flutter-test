import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_main/common/exception.dart';
import 'package:flutter_main/views/4_component/error_dialog_component.dart';

// 紙芝居動作時に使用するユースケースのmock処理。
Map<Function, dynamic> mockUsecaseMap = {};
void setMockUsecaseMap(Function func, dynamic value) {
  mockUsecaseMap[func] = value;
}

Future<dynamic> exec(
    BuildContext ctx, Function usecaseFunc, Function callback) async {
  // ignore: avoid_print
  print("★★★★★: called function wrap関数: ${usecaseFunc.toString()}");

  if (mockUsecaseMap.containsKey(usecaseFunc)) {
    // ignore: avoid_print
    print("★★★★★: called function mock value: ${mockUsecaseMap[usecaseFunc]}");
    return mockUsecaseMap[usecaseFunc];
  }

  try {
    // ignore: todo 紙芝居モードのときは、引数のユースケース関数をkeyにしたマップが値を返す仕組みにする予定。
    final result = await callback();
    return result;
    // 各々のエラー処理が下記に記述される想定
    // タイムアウトなら、何回かリトライしたいかもだが、そういうのは
    // 各インフラストラクチャの処理でやるほうが良さそう。
    // } on TimeoutException catch (e) {
    //   showSystemErrorDialog(ctx, e.toString());
    //   rethrow;
    // } on SocketException catch (e) {
    //   showSystemErrorDialog(ctx, e.toString());
    //   rethrow;
  } on ValidateException catch (e, stackTrace) {
    // 検査例外なので、検査例外用のダイアログを用意したいが、
    // サンプルなのでシステムエラーダイアログを使っている。
    showSystemErrorDialog(ctx, e.toString(), stackTrace.toString());
    rethrow;
  } catch (e, stackTrace) {
    showSystemErrorDialog(ctx, e.toString(), stackTrace.toString());
    rethrow;
  }
}
