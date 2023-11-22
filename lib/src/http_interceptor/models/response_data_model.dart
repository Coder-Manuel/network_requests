// ignore_for_file: overridden_fields

import 'dart:typed_data';

import '../http_interceptor.dart';

final class ResponseData extends BaseResponse {
  @override
  int statusCode;

  @override
  RequestData? request;

  ByteStream stream;

  String? body;

  Future<Uint8List> get bodyBytes => stream.toBytes();

  ResponseData({
    required this.stream,
    required this.statusCode,
    this.body,
    this.request,
    int? contentLength,
    String? reasonPhrase,
    Map<String, String> headers = const {},
    bool isRedirect = false,
    bool persistentConnection = false,
  }) : super(
          statusCode,
          request: request,
          contentLength: contentLength,
          reasonPhrase: reasonPhrase,
          headers: headers,
          isRedirect: isRedirect,
          persistentConnection: persistentConnection,
        );

  Response get asResponse => Response(
        body ?? '',
        statusCode,
        request: request,
        headers: headers,
        isRedirect: isRedirect,
        reasonPhrase: reasonPhrase,
        persistentConnection: persistentConnection,
      );

  StreamedResponse get asStreamedResponse => StreamedResponse(
        stream,
        statusCode,
        request: request,
        headers: headers,
        contentLength: contentLength,
        isRedirect: isRedirect,
        reasonPhrase: reasonPhrase,
        persistentConnection: persistentConnection,
      );
}
