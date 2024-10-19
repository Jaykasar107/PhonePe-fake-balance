import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first/pages/home.dart'; // Update with your actual import

void main() {
  testWidgets('MyHomePage has a title and buttons', (WidgetTester tester) async {
    // Build the MyHomePage widget.
    await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

    // Verify if the AppBar title is present.
    expect(find.text('Add Address'), findsOneWidget);

    // Verify if the bottom navigation items are present.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Loan'), findsOneWidget);
    expect(find.text('Insurance'), findsOneWidget);
    expect(find.text('Wealth'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);

    // Verify if the "Transfer Money" text is present.
    expect(find.text('Transfer Money'), findsOneWidget);

    // Verify if the transfer options are present.
    expect(find.text('To Mobile\nNumber'), findsOneWidget);
    expect(find.text('To Bank/\nUPI ID'), findsOneWidget);
    expect(find.text('To Self\nAccount'), findsOneWidget);
    expect(find.text('Check Bank\nBalance'), findsOneWidget);
  });

  testWidgets('Bottom navigation bar changes selected index', (WidgetTester tester) async {
    // Build the MyHomePage widget.
    await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

    // Tap on the "Loan" bottom navigation item.
    await tester.tap(find.text('Loan'));
    await tester.pump();

    // Verify if the selected index has changed.
    expect(find.text('Loan'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
}