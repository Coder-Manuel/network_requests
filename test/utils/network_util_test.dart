import 'package:flutter_test/flutter_test.dart';
import 'package:network_requests/src/utils/utils.dart';

void main() {
  group('Network Util', () {
    test('success response check with code 200 ...', () {
      bool isSuccess = NetworkUtil.isResSuccess(200);

      expect(true, isSuccess);
    });

    test('success response check with code 201 ...', () {
      bool isSuccess = NetworkUtil.isResSuccess(201);

      expect(true, isSuccess);
    });

    test('success response check with code 400 ...', () {
      bool isSuccess = NetworkUtil.isResSuccess(400);

      expect(false, isSuccess);
    });

    test('success response check with code 503 ...', () {
      bool isSuccess = NetworkUtil.isResSuccess(503);

      expect(false, isSuccess);
    });
  });
}
