import '../http_interceptor/http_interceptor.dart';

/// An interceptor that can be used on [NetworkRequest] api calls.
///
/// _`NOTE: You can only implement this class (cannot be etended).`_
///
/// > * Example:
/// ```
/// class LoggingInterceptor implements NetworkRequestInterceptor {
///   @override
///     Future<BaseRequest> interceptRequest(BaseRequest request) async {
///     debugPrint(request.toString());
///
///     return request;
///    }
///
///    @override
///     Future<ResponseData> interceptResponse(ResponseData reponse) async {
///     debugPrint(response.toString());
///
///     return response;
///    }
///
/// }
/// ```
abstract interface class NetworkRequestInterceptor
    extends InterceptorContract {}

/// A retry interceptor that can be used to retry a request.
///
/// A good use-case could be when a token is expired.
abstract interface class RetryInterceptor extends RetryPolicy {}
