import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:restartserviceapp/main.dart';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  /*testWidgets('Test down and UP API', (WidgetTester tester) async {
    await tester.runAsync(() async {
      HttpOverrides.global = _MyHttpOverrides();

      await tester.pumpWidget(const MyApp());

      Finder finder = find.byKey(const Key('btn'));

      await tester.tap(finder);

      await tester.pumpAndSettle(const Duration(seconds: 30));

      await Future.delayed(const Duration(seconds: 160));

      await tester.pumpAndSettle();

      finder = find.text('54321');

      expect(finder, findsOneWidget);
    }, additionalTime: const Duration(seconds: 1));
  });*/

  testWidgets('Test down and UP API calling methods',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      HttpOverrides.global = _MyHttpOverrides();

      await downServer();

      bool test = await testRestartApi();

      await downServer();

      expect(true, test);
    }, additionalTime: const Duration(seconds: 1));
  });
}
