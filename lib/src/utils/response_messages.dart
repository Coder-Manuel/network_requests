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
      case ResponseMessage.serverTimeout:
        return 'Oops! It seems our server is taking longer than expected to respond. Please try again later.';
      case ResponseMessage.handshakeError:
        return 'We encountered an issue while securing your connection. Please try again later.';
      default:
        return null;
    }
  }

  int? get code {
    switch (this) {
      case ResponseMessage.okay:
      case ResponseMessage.created:
        return 200;
      case ResponseMessage.serverTimeout:
        return 504;
      case ResponseMessage.handshakeError:
        return 522;
      case ResponseMessage.noInternet:
        return 8005;
      default:
        return 8001;
    }
  }
}
