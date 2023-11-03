import 'package:network_requests/http_interceptor/lib/http_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('BaseResponse.copyWith: ', () {
    test('Response is copied from BaseResponse', () {
      // Arrange
      final BaseResponse baseResponse = Response("{'foo': 'bar'}", 200);

      // Act
      final copiedBaseRequest = baseResponse.copyWith();
      final copied = copiedBaseRequest as Response;

      // Assert
      final response = baseResponse as Response;
      expect(copied.hashCode, isNot(equals(response.hashCode)));
      expect(copied.statusCode, equals(response.statusCode));
      expect(copied.body, equals(response.body));
      expect(copied.headers, equals(response.headers));
      expect(copied.isRedirect, equals(response.isRedirect));
      expect(copied.reasonPhrase, equals(response.reasonPhrase));
      expect(
          copied.persistentConnection, equals(response.persistentConnection));
    });
  });
}
