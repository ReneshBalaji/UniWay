// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package.flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Make sure the import path points to your main.dart file.
// If your test file is in `test/` and your main file is in `lib/`,
// you might need to adjust the package name `uniway_app` to match your project's name
// in pubspec.yaml.
import 'package:uniway_app/main.dart'; // Assuming your app name is 'uniway_app'

void main() {
  // A test group for the Splash Screen widgets.
  group('SplashScreen', () {
    testWidgets('should display logo and footer text', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the main logo text is present.
      // We look for the two parts of the logo separately.
      expect(find.text('Uni'), findsOneWidget);
      expect(find.text('Way'), findsOneWidget);

      // Verify that the footer text is present.
      expect(find.text('- MUJ, Mapped Right -'), findsOneWidget);
    });

    testWidgets('has the correct background color', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Find the Scaffold widget.
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));

      // Verify that the background color of the Scaffold matches the design.
      expect(scaffold.backgroundColor, const Color(0xFFF7F5F0));
    });
  });
}
