part of 'functions.dart';

/// Return the response of the request
///
/// > * _@param: (required)_ __[int]__ status => The status code from the request
///
/// > * _@param: (required)_ __[String]__ body
ApiResponse respData(Response res) {
  ApiResponse response = ApiResponse();

  final body = res.body.isNotEmpty ? json.decode(res.body) : {};

  response.isSuccess = NetworkUtil.isResSuccess(res.statusCode);
  response.message = extractMessage(res.statusCode).value;
  response.statusCode = res.statusCode;
  response.bytes = res.bodyBytes;
  response.data = body;

  return response;
}

ResponseMessage extractMessage(int status) {
  ResponseMessage message = ResponseMessage.okay;

  switch (status) {
    case 200:
      message = ResponseMessage.okay;
      break;
    case 201:
      message = ResponseMessage.created;
      break;
    case 400:
      message = ResponseMessage.badRequest;
      break;
    case 401:
      message = ResponseMessage.unAuthorized;
      break;
    case 403:
      message = ResponseMessage.forbidden;
      break;
    case 404:
      message = ResponseMessage.notFound;
      break;
    case 405:
      message = ResponseMessage.methodNotAllowed;
      break;
    case 500:
      message = ResponseMessage.internalServerError;
      break;
    case 502:
      message = ResponseMessage.badGateway;
      break;
    default:
      message = ResponseMessage.somethingWentWrong;
  }

  return message;
}

/// Returns the response [ApiResponse] from an upload request.
///
/// > * _@param: (required)_ __[StreamedResponse]__ request
Future<ApiResponse> uploadRespData(http.StreamedResponse? response) async {
  // * Collect the data of the stream
  final bytes = await response?.stream.toBytes();

  // * Get the Response
  final res = Response.bytes(
    bytes?.toList() ?? [],
    response?.statusCode ?? 0,
    request: response?.request,
  );

  return respData(res);
}

String? bodyParser(Object? body) {
  String? value;

  if (body == null) {
    return value;
  }

  if (body is String) {
    value = body;
  } else {
    value = json.encode(body);
  }

  return value;
}
