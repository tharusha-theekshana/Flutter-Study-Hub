import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/testing/sections/widget_testing/widgets/user_profile_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Widget tests for User Profile Card", () {
    testWidgets("Test render all user information correctly", (widgetTester) async {
      bool? favouriteStatus;
      bool editPressed = false;

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserProfileCard(
              name: "Test",
              email: "test@gmail.com",
              avatarUrl: "https://robohash.org/246.29.194.169.png",
              onFavorite: (status) => favouriteStatus = status,
              onEdit: () => editPressed = true,
            ),
          ),
        ),
      );

      expect(find.text("Posts"), findsOneWidget);
      expect(find.text("Test"), findsOneWidget);

      // Find icon widget
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);

      // Tap favourite icon
      await widgetTester.tap(find.byIcon(Icons.favorite_border));
      expect(favouriteStatus, true);

      // Rebuild widget tree
      await widgetTester.pump();

      expect(find.byIcon(Icons.favorite_border), findsNothing);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('Test null values works correctly', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfileCard(
              name: "Test",
              email: "test@gmail.com",
              avatarUrl: "https://robohash.org/246.29.194.169.png",
            ),
          ),
        ),
      );

      // Verify buttons still exist
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);

      // Verify tapping doesn't crash when callbacks are null
      await widgetTester.tap(find.byIcon(Icons.favorite_border));
      await widgetTester.pump();
      await widgetTester.tap(find.byIcon(Icons.edit));
      await widgetTester.pump();
    });

    testWidgets("Test applies correct styling and structure",(widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfileCard(
              name: "Test",
              email: "test@gmail.com",
              avatarUrl: "https://robohash.org/246.29.194.169.png",
            ),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);

      // Test styles applies
      final nameFinder = find.text("Test");
      final nameWidget = widgetTester.widget<Text>(nameFinder);

      expect(nameWidget.style?.fontSize,
          Theme.of(widgetTester.element(nameFinder)).textTheme.titleLarge?.fontSize);

      // Test layout structure
      expect(find.byType(Row), findsNWidgets(2));
      expect(find.byType(Column), findsNWidgets(5));

    },);
  });
}
