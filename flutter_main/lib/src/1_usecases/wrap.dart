
Future<dynamic> exec(Function fff, Function callback) {
  // ignore: avoid_print
  print("called function wrap関数:${fff.toString()}");
  final result = callback();
  return result;
}
