import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/uv_condition.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/pages/uv_index_page.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'uv_index_page_test.mocks.dart';

final weather = MockWeather();

Widget createWidget() => ChangeNotifierProvider<Weather>.value(
      value: weather,
      child: const MaterialApp(
        home: UVIndexPage(),
      ),
    );

@GenerateMocks([Weather])
void main() {
  var condition = UVCondition.fromIndex(0);

  group('Low', () {
    setUp(() {
      reset(weather);
      condition = UVCondition.fromIndex(2.91);
      when(weather.uvCondition).thenReturn(condition);
    });

    testWidgets('displays the UV index', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('2.9 Low'), findsOneWidget);
    });

    testWidgets('displays the UV index as the proper', (tester) async {
      await tester.pumpWidget(createWidget());
      final text = find.text('2.9 Low').evaluate().single.widget as Text;
      expect(text.style?.color, Colors.green);
    });

    testWidgets('displays the proper advice', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text(condition.advice), findsOneWidget);
    });
  });

  group('Moderate', () {
    setUp(() {
      reset(weather);
      condition = UVCondition.fromIndex(5.75);
      when(weather.uvCondition).thenReturn(condition);
    });

    testWidgets('displays the UV index', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('5.8 Moderate'), findsOneWidget);
    });

    testWidgets('displays the UV index as the proper color', (tester) async {
      await tester.pumpWidget(createWidget());
      final text = find.text('5.8 Moderate').evaluate().single.widget as Text;
      expect(text.style?.color, Colors.amber);
    });

    testWidgets('displays the proper advice', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text(condition.advice), findsOneWidget);
    });
  });

  group('High', () {
    setUp(() {
      reset(weather);
      condition = UVCondition.fromIndex(7.63);
      when(weather.uvCondition).thenReturn(condition);
    });

    testWidgets('displays the UV index', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('7.6 High'), findsOneWidget);
    });

    testWidgets('displays the UV index as the proper color', (tester) async {
      await tester.pumpWidget(createWidget());
      final text = find.text('7.6 High').evaluate().single.widget as Text;
      expect(text.style?.color, Colors.orange);
    });

    testWidgets('displays the proper advice', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text(condition.advice), findsOneWidget);
    });
  });

  group('Very High', () {
    setUp(() {
      reset(weather);
      condition = UVCondition.fromIndex(8.13);
      when(weather.uvCondition).thenReturn(condition);
    });

    testWidgets('displays the UV index', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('8.1 Very high'), findsOneWidget);
    });

    testWidgets('displays the UV index as the proper color', (tester) async {
      await tester.pumpWidget(createWidget());
      final text = find.text('8.1 Very high').evaluate().single.widget as Text;
      expect(text.style?.color, Colors.deepOrange);
    });

    testWidgets('displays the proper advice', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text(condition.advice), findsOneWidget);
    });
  });

  group('Extreme', () {
    setUp(() {
      reset(weather);
      condition = UVCondition.fromIndex(12.0);
      when(weather.uvCondition).thenReturn(condition);
    });

    testWidgets('displays the UV index', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('12.0 Extreme'), findsOneWidget);
    });

    testWidgets('displays the UV index as the proper color', (tester) async {
      await tester.pumpWidget(createWidget());
      final text = find.text('12.0 Extreme').evaluate().single.widget as Text;
      expect(text.style?.color, Colors.red);
    });

    testWidgets('displays the proper advice', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.text(condition.advice), findsOneWidget);
    });
  });
}
