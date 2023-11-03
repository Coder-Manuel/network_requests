import 'package:flutter/foundation.dart';
import 'package:network_requests/http_interceptor/lib/http_interceptor.dart';
import 'package:network_requests/network_requests.dart';

@protected
class LoggingInterceptor implements NetworkRequestInterceptor {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final logInfo = 'REQ -> method: ${request.method}, url: ${request.url}';
    Logger.log(logInfo);

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    final logInfo =
        'RES -> method: ${response.request?.method}, status: ${response.statusCode}, url: ${response.request?.url}';

    if (NetworkUtil.isResSuccess(response.statusCode)) {
      Logger.log(logInfo);
    } else {
      Logger.logError(logInfo);
    }

    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() => Future.value(true);

  @override
  Future<bool> shouldInterceptResponse() => Future.value(true);
}
