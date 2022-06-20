import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/widgets/temperature.dart';
import 'package:provider/provider.dart';

final userPreferences = UserPreferences();

Widget createWidget(double temperature) =>
    ChangeNotifierProvider<UserPreferences>.value(
      value: userPreferences,
      child: MaterialApp(
        home: Temperature(temperature),
      ),
    );

void main() {
  group('fahrenheit', () {
    setUp(() {
      if (userPreferences.scale != Scale.fahrenheit) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the temperature in fahrenheit', (tester) async {
      await tester.pumpWidget(createWidget(293.15));
      expect(find.text('68 ℉'), findsOneWidget);
      expect(find.textContaining('℃'), findsNothing);
    });

    testWidgets('rounds the temperature up', (tester) async {
      await tester.pumpWidget(createWidget(293.43));
      expect(find.text('69 ℉'), findsOneWidget);
      expect(find.textContaining('℃'), findsNothing);
    });
  });

  group('celsius', () {
    setUp(() {
      if (userPreferences.scale != Scale.celsius) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the temperature in fahrenheit', (tester) async {
      await tester.pumpWidget(createWidget(293.15));
      expect(find.text('20 ℃'), findsOneWidget);
      expect(find.textContaining('℉'), findsNothing);
    });

    testWidgets('rounds the temperature up', (tester) async {
      await tester.pumpWidget(createWidget(293.65));
      expect(find.text('21 ℃'), findsOneWidget);
      expect(find.textContaining('℉'), findsNothing);
    });
  });
}
