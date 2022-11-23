import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:restartserviceapp/main.dart';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  testWidgets('Test down and UP API calling methods',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      HttpOverrides.global = _MyHttpOverrides();

      await downServer();
      print('api is down');

      bool test = await testRestartApi();

      print('api returned: $test');

      await downServer();

      print('api is down');

      expect(true, test);
    }, additionalTime: const Duration(seconds: 1));
  });
}
