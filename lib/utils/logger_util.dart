part of '../network_requests.dart';

@protected
class Logger {
  /// Logs out message but must be used with DartVM
  static void log(String message) {
    developer.log(message, name: 'NETWORK_REQUESTS');
  }

  /// Logs out error message but must be used with DartVM
  static void logError(String message) {
    developer.log('', name: 'NETWORK_REQUESTS', level: 900, error: message);
  }
}
