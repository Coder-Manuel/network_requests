import 'package:flutter_test/flutter_test.dart';
import 'package:network_requests/src/http_interceptor/http_interceptor.dart';

void main() {
  group('RequestData Convertion', () {
    test('convertion from Request subtype should work ...', () {
      const body = 'request_body';
      final req = Request('GET', Uri.parse(''))..body = body;
      final request = RequestData.fromBaseRequest(req);

      expect(request.body, isNotNull);
      expect(request.body, equals(body));
    });

    test('convertion from StreamedRequest subtype should work ...', () {
      final request = RequestData.fromBaseRequest(
        StreamedRequest('GET', Uri.parse('')),
      );
      expect(request.body, isNull);
      expect(request.encoding, isNull);
      expect(request.fields, isNull);
      expect(request.files, isNull);
    });
    test('convertion from MultipartRequest subtype should work ...', () {
      final request = RequestData.fromBaseRequest(
        MultipartRequest('GET', Uri.parse('')),
      );

      // * Some values should be null.
      expect(request.body, isNull);
      expect(request.encoding, isNull);

      // * MultipartRequest values should not be null.
      expect(request.fields, isNotNull);
      expect(request.fields, isEmpty);
      expect(request.files, isNotNull);
      expect(request.files, isEmpty);
    });
  });
}
