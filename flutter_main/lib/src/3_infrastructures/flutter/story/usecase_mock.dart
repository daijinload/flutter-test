import 'package:flutter_main/views/3_template/wrap_template.dart';
import 'package:flutter_main/src/1_usecases/user_usecase.dart' as user_usecase;

void exec() {
  setMockUsecaseMap(user_usecase.userInfo, '文字列を返す!!');
}
