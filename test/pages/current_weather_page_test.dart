import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/current_location.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/pages/current_weather_page.dart';
import 'package:local_weather/widgets/temperature.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'current_weather_page_test.mocks.dart';

final currentLocation = MockCurrentLocation();
final weather = MockWeather();
final userPreferences = UserPreferences();

Widget createWidget() => MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentLocation>.value(
          value: currentLocation,
        ),
        ChangeNotifierProvider<UserPreferences>.value(
          value: userPreferences,
        ),
        ChangeNotifierProvider<Weather>.value(
          value: weather,
        ),
      ],
      child: const MaterialApp(
        home: CurrentWeatherPage(),
      ),
    );

@GenerateMocks([CurrentLocation, Weather])
void main() {
  final condition = Condition.fromRawCondition(800);

  setUp(() {
    when(currentLocation.locationName).thenReturn('New London, WI');
    when(weather.condition).thenReturn(condition);
    when(weather.temperature).thenReturn(293.45);
  });

  testWidgets('displays the location name', (tester) async {
    await tester.pumpWidget(createWidget());
    expect(find.text('New London, WI'), findsOneWidget);
  });

  testWidgets('displays the condition text', (tester) async {
    await tester.pumpWidget(createWidget());
    expect(find.text(condition.description), findsOneWidget);
  });

  testWidgets('displays the condition image', (tester) async {
    await tester.pumpWidget(createWidget());
    final image = find.byType(Image).evaluate().single.widget as Image;
    expect((image.image as AssetImage).assetName, condition.image);
  });

  group('fahrenheit', () {
    setUp(() {
      if (userPreferences.scale != Scale.fahrenheit) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the temperature', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('69 ℉'), findsOneWidget);
    });

    testWidgets('switches to celsius on tap', (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.tap(find.byType(Temperature));
      await tester.pump();
      expect(find.text('20 ℃'), findsOneWidget);
      expect(find.text('69 ℉'), findsNothing);
    });
  });

  group('celsius', () {
    setUp(() {
      if (userPreferences.scale != Scale.celsius) {
        userPreferences.toggleScale();
      }
    });

    testWidgets('displays the temperature', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('20 ℃'), findsOneWidget);
    });

    testWidgets('switches to fahrenheit on tap', (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.tap(find.byType(Temperature));
      await tester.pump();
      expect(find.text('69 ℉'), findsOneWidget);
      expect(find.text('20 ℃'), findsNothing);
    });
  });
}
