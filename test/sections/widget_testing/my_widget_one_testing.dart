import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/testing/sections/widget_testing/widgets/my_widget_one.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test my widget one", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MyWidgetOne(title: "Hello", message: "Message")
        ),
      ),
    );

    final titleFinder = find.text("Hello");
    final messageFinder = find.text("Message");

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
