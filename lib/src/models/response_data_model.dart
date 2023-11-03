part of '../../network_requests.dart';

abstract class ResponseData extends Response {
  ResponseData(super.method, super.url);
}

abstract class RequestData extends Request {
  RequestData(super.method, super.url);
}
