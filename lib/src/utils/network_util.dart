part of 'utils.dart';

class NetworkUtil {
  static final List<int> _successCodes = [200, 201, 204, 206, 207, 208, 266];

  static bool isResSuccess(int code) {
    return _successCodes.contains(code);
  }
}
