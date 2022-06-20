import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/uv_condition.dart';
import 'package:local_weather/models/weather.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('load', () {
    final url = Uri.https('api.openweathermap.org', '/data/2.5/onecall', {
      'lat': '43.074085',
      'lon': '-89.381027',
      'exclude': 'minutely',
      'appid': 'thisIsAFakeKey',
    });

    final data = {
      "current": {
        "dt": 1646318698,
        "temp": 282.21,
        "uvi": 2.55,
        "weather": [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03d"
          }
        ]
      },
      "daily": [
        {
          'dt': 1642226400,
          'temp': {
            'min': 290.37,
            'max': 302.59,
          },
          'weather': [
            {
              'id': 800,
              'main': 'Clear',
              'description': 'clear sky',
              'icon': '01d',
            },
          ],
        },
        {
          'dt': 1642291200,
          'temp': {
            'min': 291.5,
            'max': 300.72,
          },
          'weather': [
            {
              'id': 802,
              'main': 'Cloudy',
              'description': 'scattered clouds',
              'icon': '01d',
            },
          ],
        }
      ]
    };

    MockClient client = MockClient();

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: '.env.test');
    });

    setUp(() {
      reset(client);
      when(client.get(url))
          .thenAnswer((_) async => http.Response(jsonEncode(data), 200));
    });

    test('should get the data from the server', () {
      final weather = Weather(client);
      weather.load();
      verify(client.get(url)).called(1);
    });

    test('should extract the temp', () async {
      final weather = Weather(client);
      await weather.load();
      expect(weather.temperature, 282.21);
    });

    test('should extract the condition', () async {
      final expectedCondition = Condition.fromRawCondition(802);
      final weather = Weather(client);
      await weather.load();
      expect(weather.condition.title, expectedCondition.title);
      expect(weather.condition.description, expectedCondition.description);
      expect(weather.condition.image, expectedCondition.image);
    });

    test('should extract the UV condition', () async {
      final expectedCondition = UVCondition.fromIndex(2.55);
      final weather = Weather(client);
      await weather.load();
      expect(weather.uvCondition.advice, expectedCondition.advice);
      expect(weather.uvCondition.uvIndex, 2.55);
      expect(weather.uvCondition.riskFactor, expectedCondition.riskFactor);
      expect(weather.uvCondition.description, expectedCondition.description);
    });

    test('should handle the empty daily list', () async {
      final weather = Weather(client);
      await weather.load();
      expect(weather.dailyForecasts.length, 2);
    });

    test('should load the daily forecasts', () async {
      when(client.get(url)).thenAnswer(
          (_) async => http.Response(jsonEncode({...data, "daily": []}), 200));
      final weather = Weather(client);
      await weather.load();
      expect(weather.dailyForecasts.length, 0);
    });
  });
}
