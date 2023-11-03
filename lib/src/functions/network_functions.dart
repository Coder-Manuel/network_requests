part of '../../network_requests.dart';

/// Return the response of the request
///
/// > * _@param: (required)_ __[int]__ status => The status code from the request
///
/// > * _@param: (required)_ __[String]__ body
ApiResponse respData(int? status, String rawBody) {
  ApiResponse response = ApiResponse();

  final body = rawBody.isNotEmpty ? json.decode(rawBody) : {};

  if (status == null) {
    response.data = body;
    return response;
  }

  switch (status) {
    case 200:
      response.status = status;
      response.data = body;
      response.message = ResponseMessage.OKAY.value;
      response.success = true;
      break;
    case 201:
      response.status = status;
      response.data = body;
      response.message = ResponseMessage.CREATED.value;
      response.success = true;
      break;
    case 400:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.BAD_REQUEST.value;
      response.success = false;
      break;
    case 401:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.UNAUTHORIZED.value;
      response.success = false;
      break;
    case 403:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.FORBIDDEN.value;
      response.success = false;
      break;
    case 404:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.NOT_FOUND.value;
      response.success = false;
      break;
    case 405:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.METHOD_NOT_ALLOWED.value;
      response.success = false;
      break;
    case 500:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.INTERNAL_SERVER_ERROR.value;
      response.success = false;
      break;
    default:
      response.status = status;
      response.exception = body;
      response.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
      response.success = false;
  }

  return response;
}

/// Returns the response [ApiResponse] from an upload request.
///
/// > * _@param: (required)_ __[StreamedResponse]__ request
Future<ApiResponse> uploadRespData(http.StreamedResponse? request) async {
  // * Collect the data of the stream
  final res = await request?.stream.toBytes();

  // * Get the body
  final body = String.fromCharCodes(res ?? []);

  // * Obtain the response
  final response = respData(request?.statusCode, body);

  return response;
}

String bodyParser(Object? body) {
  late String value;
  if (body is String) {
    value = body;
  } else {
    value = json.encode(body ?? {});
  }

  return value;
}
