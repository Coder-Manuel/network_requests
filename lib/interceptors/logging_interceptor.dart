import 'package:http_interceptor/http_interceptor.dart';
import 'package:network_requests/interceptors/network_request_interceptor.dart';
import 'package:network_requests/utils/logger_util.dart';

class LoggingInterceptor implements NetworkRequsetInterceptor {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final logInfo = 'REQ -> method: ${data.method.name}, url: ${data.url}';
    Logger.log(logInfo);

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    final logInfo =
        'RES -> method: ${data.method?.name}, status: ${data.statusCode}, url: ${data.url}';

    if (data.statusCode == 200 || data.statusCode == 201) {
      Logger.log(logInfo);
    } else {
      Logger.logError(logInfo);
    }

    return data;
  }
}
