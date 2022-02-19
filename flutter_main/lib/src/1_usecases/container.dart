import 'package:flutter_main/src/1_usecases/user_usecase.dart' as user_usecase;

Map<String, Future<dynamic> Function(String)?> functionMap = {};

void setFunctionMap(String path, Function func) {
  functionMap[path] = (String name) async {
    // ignore: avoid_print
    print('start $path $name');
    var aaa = await func(name);
    // ignore: avoid_print
    print('end $aaa');

    return aaa;
  };

  // functionMap[path] = greeting;
}

Future<dynamic> Function(String) get(String path) {
  Future<dynamic> Function(String)? f = functionMap[path];
  if (f == null) {
    throw Exception('not found function: $path');
  }
  return f;
}

void setUp() {
  setFunctionMap("/user/info", user_usecase.userInfo);
}
