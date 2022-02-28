import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_main/views/4_component/error_dialog_component.dart';

Future<dynamic> exec(BuildContext ctx, Function usecaseFunc, Function callback) async {
  // ignore: avoid_print
  print("★★★★★: called function wrap関数: ${usecaseFunc.toString()}");
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
  } catch (e, stackTrace) {
    showSystemErrorDialog(ctx, e.toString() + stackTrace.toString());
    rethrow;    
  }
}
