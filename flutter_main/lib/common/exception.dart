
/// 検査例外時の独自Exception
class ValidateException implements Exception {
  String message;
  ValidateException(this.message);
}
