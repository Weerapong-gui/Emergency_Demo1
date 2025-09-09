// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:emergency_demo1/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login success navigates to Home', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify login UI exists
    expect(find.text('Emergency'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Username'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Sign In'), findsOneWidget);

    // Enter valid credentials and submit
    await tester.enterText(find.byKey(const Key('usernameField')), 'admin');
    await tester.enterText(find.byKey(const Key('passwordField')), '12345678');
    await tester.tap(find.byKey(const Key('signInButton')));
    await tester.pumpAndSettle();

    // Expect to be on Home page
    expect(find.byKey(const Key('homeScreen')), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
}
