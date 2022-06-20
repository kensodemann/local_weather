import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/daily_forecast.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/pages/forecast_page.dart';
import 'package:local_weather/widgets/daily_condition_details.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'forecast_page_test.mocks.dart';

final weather = MockWeather();

Widget createWidget() => MultiProvider(
      providers: [
        ChangeNotifierProvider<UserPreferences>(
          create: (_) => UserPreferences(),
        ),
        ChangeNotifierProvider<Weather>.value(
          value: weather,
        ),
      ],
      child: const MaterialApp(
        home: ForecastPage(),
      ),
    );

@GenerateMocks([Weather])
void main() {
  testWidgets('handles displaying no forecasts properly', (tester) async {
    when(weather.dailyForecasts).thenReturn([]);
    await tester.pumpWidget(createWidget());
    expect(find.byType(DailyConditionDetails), findsNothing);
  });

  testWidgets('displays a row for each forecast', (tester) async {
    when(weather.dailyForecasts).thenReturn([
      DailyForecast(
        date: DateTime(2020, 1, 1),
        condition: Condition.fromRawCondition(800),
        high: 293.45,
        low: 302.65,
      ),
      DailyForecast(
        date: DateTime(2020, 1, 2),
        condition: Condition.fromRawCondition(212),
        high: 295.15,
        low: 299.55,
      ),
      DailyForecast(
        date: DateTime(2020, 1, 3),
        condition: Condition.fromRawCondition(800),
        high: 293.45,
        low: 302.65,
      ),
    ]);
    await tester.pumpWidget(createWidget());
    expect(find.byType(DailyConditionDetails), findsNWidgets(3));
  });
}
