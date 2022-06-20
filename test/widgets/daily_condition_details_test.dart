import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/daily_forecast.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/widgets/daily_condition_details.dart';
import 'package:local_weather/widgets/temperature.dart';
import 'package:local_weather/widgets/temperature_row.dart';
import 'package:provider/provider.dart';

final userPreferences = UserPreferences();

Widget createWidget(DailyForecast forecast) =>
    ChangeNotifierProvider<UserPreferences>.value(
      value: userPreferences,
      child: MaterialApp(
        home: DailyConditionDetails(forecast),
      ),
    );

void main() {
  final date = DateTime(2022, 6, 21);
  final condition = Condition.fromRawCondition(212);
  final forecast = DailyForecast(
      date: date, high: 302.65, low: 295.45, condition: condition);

  testWidgets('displays the date', (tester) async {
    await tester.pumpWidget(createWidget(forecast));
    expect(find.text('Tue, Jun 21, 2022'), findsOneWidget);
  });

  testWidgets('displays the condition text', (tester) async {
    await tester.pumpWidget(createWidget(forecast));
    expect(find.text(condition.description), findsOneWidget);
  });

  testWidgets('displays two temperature rows', (tester) async {
    await tester.pumpWidget(createWidget(forecast));
    expect(find.byType(TemperatureRow), findsNWidgets(2));
  });

  group('fahrenheit', () {
    setUp(() {
      if (userPreferences.scale != Scale.fahrenheit) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the low temperature', (tester) async {
      await tester.pumpWidget(createWidget(forecast));
      final row = find.byType(TemperatureRow).first;
      expect(find.descendant(of: row, matching: find.text('Low:')),
          findsOneWidget);
      expect(find.descendant(of: row, matching: find.text('72 ℉')),
          findsOneWidget);
    });

    testWidgets('displays the high temperature', (tester) async {
      await tester.pumpWidget(createWidget(forecast));
      final row = find.byType(TemperatureRow).last;
      expect(find.descendant(of: row, matching: find.text('High:')),
          findsOneWidget);
      expect(find.descendant(of: row, matching: find.text('85 ℉')),
          findsOneWidget);
    });
  });

  group('celsius', () {
    setUp(() {
      if (userPreferences.scale != Scale.celsius) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the low temperature', (tester) async {
      await tester.pumpWidget(createWidget(forecast));
      final row = find.byType(TemperatureRow).first;
      expect(find.descendant(of: row, matching: find.text('Low:')),
          findsOneWidget);
      expect(find.descendant(of: row, matching: find.text('22 ℃')),
          findsOneWidget);
    });

    testWidgets('displays the high temperature', (tester) async {
      await tester.pumpWidget(createWidget(forecast));
      final row = find.byType(TemperatureRow).last;
      expect(find.descendant(of: row, matching: find.text('High:')),
          findsOneWidget);
      expect(find.descendant(of: row, matching: find.text('30 ℃')),
          findsOneWidget);
    });
  });
}
