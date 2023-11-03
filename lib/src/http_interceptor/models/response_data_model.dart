import 'dart:typed_data';

import 'package:http/http.dart';

typedef RequestData = BaseRequest;

class ResponseData extends BaseResponse {
  @override
  // ignore: overridden_fields
  int statusCode;

  ByteStream stream;

  String? body;

  Future<Uint8List> get bodyBytes => stream.toBytes();

  ResponseData({
    required this.stream,
    required this.statusCode,
    this.body,
    BaseRequest? request,
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

  Future<Response> get asResponse async => Response.bytes(
        await stream.toBytes(),
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
