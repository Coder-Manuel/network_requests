part of '../../network_requests.dart';

class NetworkRequestException implements Exception {
  final dynamic message;

  final int errorCode;

  @pragma("vm:entry-point")
  NetworkRequestException([this.message, this.errorCode = 8001]);

  @override
  String toString() {
    if (message == null) return "Exception";
    return "ErrorCode: $errorCode\nException: $message";
  }
}
