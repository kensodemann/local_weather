import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/models/uv_condition.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/pages/current_weather_page.dart';
import 'package:local_weather/pages/forecast_page.dart';
import 'package:local_weather/pages/tabs_page.dart';
import 'package:local_weather/pages/uv_index_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'tabs_page_test.mocks.dart';

final weather = MockWeather();
final userPreferences = UserPreferences();

Widget createWidget() => MultiProvider(
      providers: [
        ChangeNotifierProvider<UserPreferences>.value(
          value: userPreferences,
        ),
        ChangeNotifierProvider<Weather>.value(
          value: weather,
        ),
      ],
      child: const MaterialApp(
        home: TabsPage(),
      ),
    );

@GenerateMocks([Weather])
void main() {
  setUp(() {
    reset(weather);
    when(weather.condition).thenReturn(Condition.fromRawCondition(800));
    when(weather.dailyForecasts).thenReturn([]);
    when(weather.uvCondition).thenReturn(UVCondition.fromIndex(2.9));
    when(weather.temperature).thenReturn(293.45);
  });

  testWidgets('contains three navigation tabs', (tester) async {
    await tester.pumpWidget(createWidget());
    final nav = find.byType(BottomNavigationBar);
    expect(find.descendant(of: nav, matching: find.byType(Text)),
        findsNWidgets(3));
    expect(find.descendant(of: nav, matching: find.text('Current Weather')),
        findsOneWidget);
    expect(find.descendant(of: nav, matching: find.text('Forecast')),
        findsOneWidget);
    expect(find.descendant(of: nav, matching: find.text('UV Index')),
        findsOneWidget);
  });

  testWidgets('starts on the current weather page', (tester) async {
    await tester.pumpWidget(createWidget());
    final appBar = find.byType(AppBar);
    expect(find.descendant(of: appBar, matching: find.text('Current Weather')),
        findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('Forecast')),
        findsNothing);
    expect(find.descendant(of: appBar, matching: find.text('UV Index')),
        findsNothing);
  });

  testWidgets('tapping forecast goes to the forecast page', (tester) async {
    await tester.pumpWidget(createWidget());
    final appBar = find.byType(AppBar);
    final nav = find.byType(BottomNavigationBar);
    await tester.tap(find.descendant(of: nav, matching: find.text('Forecast')));
    await tester.pump();
    expect(find.descendant(of: appBar, matching: find.text('Current Weather')),
        findsNothing);
    expect(find.descendant(of: appBar, matching: find.text('Forecasts')),
        findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('UV Index')),
        findsNothing);
    expect(find.byType(CurrentWeatherPage), findsNothing);
    expect(find.byType(ForecastPage), findsOneWidget);
    expect(find.byType(UVIndexPage), findsNothing);
  });

  testWidgets('tapping UV Index goes to the uv index page', (tester) async {
    await tester.pumpWidget(createWidget());
    final appBar = find.byType(AppBar);
    final nav = find.byType(BottomNavigationBar);
    await tester.tap(find.descendant(of: nav, matching: find.text('UV Index')));
    await tester.pump();
    expect(find.descendant(of: appBar, matching: find.text('Current Weather')),
        findsNothing);
    expect(find.descendant(of: appBar, matching: find.text('Forecasts')),
        findsNothing);
    expect(find.descendant(of: appBar, matching: find.text('UV Index')),
        findsOneWidget);
    expect(find.byType(CurrentWeatherPage), findsNothing);
    expect(find.byType(ForecastPage), findsNothing);
    expect(find.byType(UVIndexPage), findsOneWidget);
  });

  testWidgets('tapping Current Weather goes back to the current weather page',
      (tester) async {
    await tester.pumpWidget(createWidget());
    final appBar = find.byType(AppBar);
    final nav = find.byType(BottomNavigationBar);
    await tester.tap(find.descendant(of: nav, matching: find.text('UV Index')));
    await tester.pump();
    await tester
        .tap(find.descendant(of: nav, matching: find.text('Current Weather')));
    await tester.pump();
    expect(find.descendant(of: appBar, matching: find.text('Current Weather')),
        findsOneWidget);
    expect(find.descendant(of: appBar, matching: find.text('Forecasts')),
        findsNothing);
    expect(find.descendant(of: appBar, matching: find.text('UV Index')),
        findsNothing);
    expect(find.byType(CurrentWeatherPage), findsOneWidget);
    expect(find.byType(ForecastPage), findsNothing);
    expect(find.byType(UVIndexPage), findsNothing);
  });
}
