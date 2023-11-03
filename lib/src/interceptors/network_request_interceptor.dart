import '../http_interceptor/http_interceptor.dart';

/// An interceptor that can be used on [NetworkRequest] api calls.
///
/// This interceptor uses the technique in `package: http_interceptor`.
///
/// > * Example:
/// ```
/// class LoggingInterceptor implements InterceptorContract {
///   @override
///     Future<RequestData> interceptRequest({required RequestData request}) async {
///     debugPrint(request.toString());
///
///     return request;
///    }
///
///    @override
///     Future<ResponseData> interceptResponse({required ResponseData reponse}) async {
///     debugPrint(response.toString());
///
///     return response;
///    }
///
/// }
/// ```
abstract class NetworkRequestInterceptor implements InterceptorContract {}

/// A retry interceptor that can be used to retry a request.
///
/// A good use-case could be when a token is expired.
abstract class RetryInterceptor extends RetryPolicy {}
