// ignore_for_file: constant_identifier_names

part of '../network_requests.dart';

enum ResponseMessage {
  OKAY,
  CREATED,
  BAD_REQUEST,
  UNAUTHORIZED,
  FORBIDDEN,
  NOT_FOUND,
  METHOD_NOT_ALLOWED,
  INTERNAL_SERVER_ERROR,
  SOMETHING_WENT_WRONG,
  NO_INTERNET,
  SERVER_TIMEOUT,
  HANDSHAKE_ERROR,
}

extension EnumValue on ResponseMessage {
  /// The Value of the Response message
  String get value => toString().split('.').last;
}
