import 'package:flutter/foundation.dart';
import 'package:network_requests/network_requests.dart';

import '../http_interceptor/models/response_data_model.dart';
import '../utils/utils.dart';

@protected
class LoggingInterceptor implements NetworkRequestInterceptor {
  @override
  Future<RequestData> interceptRequest(RequestData request) async {
    final logInfo = 'REQ -> method: ${request.method}, url: ${request.url}';
    Logger.log(logInfo);

    return request.copyWith();
  }

  @override
  Future<ResponseData> interceptResponse(ResponseData response) async {
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