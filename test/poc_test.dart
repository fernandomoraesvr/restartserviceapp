// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:restartserviceapp/main.dart';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  testWidgets('Test down and UP API', (WidgetTester tester) async {
    await tester.runAsync(() async {
      HttpOverrides.global = _MyHttpOverrides();
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      Finder finder = find.byKey(const Key('btn'));

      await tester.tap(finder);

      await tester.pumpAndSettle(const Duration(seconds: 30));

      await Future.delayed(const Duration(seconds: 50));

      await tester.pumpAndSettle();

      finder = find.text('54321');

      expect(finder, findsOneWidget);
    }, additionalTime: const Duration(seconds: 1));
  });
}
