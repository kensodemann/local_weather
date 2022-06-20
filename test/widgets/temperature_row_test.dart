import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/widgets/temperature.dart';
import 'package:local_weather/widgets/temperature_row.dart';
import 'package:provider/provider.dart';

final userPreferences = UserPreferences();

Widget createWidget(String label, double temperature) =>
    ChangeNotifierProvider<UserPreferences>.value(
      value: userPreferences,
      child: MaterialApp(
        home: TemperatureRow(label: label, temperature: temperature),
      ),
    );

void main() {
  group('fahrenheit', () {
    setUp(() {
      if (userPreferences.scale != Scale.fahrenheit) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the low temperature', (tester) async {
      await tester.pumpWidget(createWidget('Low', 293.15));
      expect(find.text('Low:'), findsOneWidget);
      expect(find.text('68 ℉'), findsOneWidget);
    });

    testWidgets('displays the high temperature', (tester) async {
      await tester.pumpWidget(createWidget('High', 308.71));
      expect(find.text('High:'), findsOneWidget);
      expect(find.text('96 ℉'), findsOneWidget);
    });
  });

  group('celsius', () {
    setUp(() {
      if (userPreferences.scale != Scale.celsius) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the low temperature', (tester) async {
      await tester.pumpWidget(createWidget('Low', 293.15));
      expect(find.text('Low:'), findsOneWidget);
      expect(find.text('20 ℃'), findsOneWidget);
    });

    testWidgets('displays the high temperature', (tester) async {
      await tester.pumpWidget(createWidget('High', 308.71));
      expect(find.text('High:'), findsOneWidget);
      expect(find.text('36 ℃'), findsOneWidget);
    });
  });
}
