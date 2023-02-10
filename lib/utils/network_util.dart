class NetworkUtil {
  static final List<int> _successCodes = [200, 201];

  static bool isResSuccess(int code) {
    return _successCodes.contains(code);
  }
}
