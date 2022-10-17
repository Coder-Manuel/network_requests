part of network_requests;

/// Return the response of the request
///
/// > * _@param: (required)_ __[int]__ status => The status code from the request
///
/// > * _@param: (required)_ __[String]__ body
ApiResponse respData(int status, String rawBody) {
  ApiResponse _response = ApiResponse();

  final body = rawBody.isNotEmpty ? json.decode(rawBody) : {};

  switch (status) {
    case 200:
      _response.status = status;
      _response.data = body;
      _response.message = ResponseMessage.OKAY.value;
      _response.success = true;
      break;
    case 201:
      _response.status = status;
      _response.data = body;
      _response.message = ResponseMessage.CREATED.value;
      _response.success = true;
      break;
    case 400:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.BAD_REQUEST.value;
      _response.success = false;
      break;
    case 401:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.UNAUTHORIZED.value;
      _response.success = false;
      break;
    case 403:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.FORBIDDEN.value;
      _response.success = false;
      break;
    case 404:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.NOT_FOUND.value;
      _response.success = false;
      break;
    case 405:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.METHOD_NOT_ALLOWED.value;
      _response.success = false;
      break;
    case 500:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.INTERNAL_SERVER_ERROR.value;
      _response.success = false;
      break;
    default:
      _response.status = status;
      _response.exception = body;
      _response.message = ResponseMessage.SOMETHING_WENT_WRONG.value;
      _response.success = false;
  }

  return _response;
}

/// Returns the response [ApiResponse] from an upload request.
///
/// > * _@param: (required)_ __[StreamedResponse]__ request
Future<ApiResponse> uploadRespData(http.StreamedResponse request) async {
  // * Collect the data of the stream
  final _res = await request.stream.toBytes();

  // * Get the body
  final body = String.fromCharCodes(_res);

  // * Obtain the response
  final _response = respData(request.statusCode, body);

  return _response;
}

String bodyParser(Object? body) {
  if (body is String) {
    return body;
  } else {
    return json.encode(body);
  }
}
