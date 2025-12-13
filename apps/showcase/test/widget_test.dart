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
  testWidgets('Showcase app renders successfully', (WidgetTester tester) async {
    // Build the ShowcaseApp and trigger a frame.
    await tester.pumpWidget(const ShowcaseApp());

    // Verify the app title exists in the MaterialApp.
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).title,
      'Flutter UI Kit Showcase',
    );

    // Verify the main layout structure is present.
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(NavigationRail), findsOneWidget);
  });
}
