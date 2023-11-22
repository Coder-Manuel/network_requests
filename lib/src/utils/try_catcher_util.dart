part of 'utils.dart';

final class TryCatcher {
  @pragma('vm:notify-debugger-on-exception')
  static FutureOr<ApiResponse> handleResponse(
    FutureOr<ApiResponse> Function() callback,
  ) {
    ApiResponse apiResponse = ApiResponse();

    try {
      return callback();
    } on TimeoutException {
      apiResponse.message = ResponseMessage.serverTimeout.value;
      apiResponse.statusCode = ResponseMessage.serverTimeout.code;
    } on SocketException {
      apiResponse.message = ResponseMessage.noInternet.value;
      apiResponse.statusCode = ResponseMessage.noInternet.code;
    } on http.ClientException {
      apiResponse.message = ResponseMessage.noInternet.value;
      apiResponse.statusCode = ResponseMessage.noInternet.code;
    } on HandshakeException {
      apiResponse.message = ResponseMessage.handshakeError.value;
      apiResponse.statusCode = ResponseMessage.handshakeError.code;
    } catch (e) {
      Logger.logError('ERROR: ${e.toString()}');
      throw NetworkRequestException(e);
    }

    return apiResponse;
  }

  @pragma('vm:notify-debugger-on-exception')
  static FutureOr<T?> handleAll<T>(
    FutureOr<T?> Function() callback,
  ) {
    try {
      return callback();
    } catch (e) {
      Logger.logError('ERROR: ${e.toString()}');
      throw NetworkRequestException(e);
    }
  }
}
