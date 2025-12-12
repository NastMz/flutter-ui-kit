// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:showcase/main.dart';

void main() {
  testWidgets('Showcase app renders title and toggle', (
    WidgetTester tester,
  ) async {
    // Build the ShowcaseApp and trigger a frame.
    await tester.pumpWidget(const ShowcaseApp());

    // Verify the app bar title exists.
    expect(find.text('Flutter UI Kit — Showcase'), findsOneWidget);

    // Verify the dark mode toggle is present.
    expect(find.byType(Switch), findsOneWidget);
  });
}
