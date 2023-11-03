import 'package:http/http.dart';

typedef RequestData = BaseRequest;

class ResponseData extends BaseResponse {
  @override
  // ignore: overridden_fields
  int statusCode;

  ByteStream stream;

  String? body;

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
}
