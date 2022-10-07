import 'package:http_interceptor/http_interceptor.dart';

/// An interceptor that can be used on [NetworkRequest] api calls.
///
/// This interceptor uses the technique in `package: http_interceptor`.
///
/// > * Example:
/// ```
/// class LoggingInterceptor implements InterceptorContract {
///   @override
///     Future<RequestData> interceptRequest({required RequestData data}) async {
///     debugPrint(data.toString());
///
///     return data;
///    }
///
///    @override
///     Future<ResponseData> interceptResponse({required ResponseData data}) async {
///     debugPrint(data.toString());
///
///     return data;
///    }
///
/// }
/// ```
abstract class NetworkRequsetInterceptor extends InterceptorContract {}
