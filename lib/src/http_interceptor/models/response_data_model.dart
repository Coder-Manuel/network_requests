import 'package:http/http.dart';

typedef RequestData = BaseRequest;

class ResponseData extends BaseResponse {
  ByteStream stream;

  String? body;

  ResponseData({
    required this.stream,
    required int statusCode,
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
}
