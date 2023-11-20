part of 'utils.dart';

enum ResponseMessage {
  okay,
  created,
  badRequest,
  unAuthorized,
  forbidden,
  notFound,
  methodNotAllowed,
  internalServerError,
  badGateway,
  somethingWentWrong,
  noInternet,
  serverTimeout,
  handshakeError,
}

extension Message on ResponseMessage {
  /// The Value of the Response message
  String? get value {
    switch (this) {
      case ResponseMessage.noInternet:
        return 'No internet connection.\nEnsure you have a stable internet.';
      case ResponseMessage.internalServerError:
        return 'We encountered an unexpected glitch.\nPlease try again later.';
      case ResponseMessage.badGateway:
        return 'Server is temporarily down.\nWe apologize for the inconvenience.';
      default:
        return null;
    }
  }
}
