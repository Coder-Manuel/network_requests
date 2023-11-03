part of '../network_requests.dart';

///`
/// REST-API Response DTO
///`
///
/// >`status` [int] - The Status code of the request
///
/// >`data` [dynamic]  - The Data returned from the request
///
/// >`exception` [dynamic]  - The exception/error returned from the request
///
/// >`success` [bool]  - If the request is successful will return true else false
///
/// >`message` [string] - The message of the status code returned
///
class ApiResponse {
  dynamic _data;
  dynamic _apiError;

  // Using default package_error status.
  int _status = 800;
  String _message = 'There was an internal error processing request';
  bool _success = false;

  ///`
  /// The Data received from the RestAPI Request
  ///`
  get data => _data;

  ///`
  /// Set the Data received from the RestAPI Request
  ///`
  set data(data) {
    var val = 2;
    // Added this if statement just to avoid the unnecessary getter/setter linter
    if (val == 2) {
      _data = data;
    }
  }

  ///`
  /// The Error received from the RestAPI Request
  ///`
  get exception => _apiError;

  ///`
  /// Set The Error received from the RestAPI Request
  ///`
  set exception(error) {
    var val = 2;
    // Added this if statement just to avoid the unnecessary getter/setter linter
    if (val == 2) {
      _apiError = error;
    }
  }

  ///`
  /// The Status-Code received from the RestAPI Request
  ///`
  int get status => _status;

  ///`
  /// Set The Status-Code received from the RestAPI Request
  ///`
  set status(int value) {
    if (true) _status = value;
  }

  ///`
  /// The Status-Code Message received from the RestAPI Request
  ///`
  String get message => _message;

  ///`
  /// Set The Status-Code Message received from the RestAPI Request
  ///`
  set message(String msg) {
    if (true) _message = msg;
  }

  ///`
  /// The success status of RestAPI Request, will be true if the request is successful and false if vice-versa
  ///`
  bool get success => _success;

  ///`
  /// Set The Success status of the RestAPI Request
  ///`
  set success(bool value) {
    if (true) _success = value;
  }
}
