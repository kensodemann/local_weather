import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/daily_forecast.dart';

void main() {
  group('loading from JSON', () {
    const json = {
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
    };

    test('extracts the date', () {
      final forecast = DailyForecast.fromJson(json);
      expect(forecast.date, DateTime(2022, 1, 15));
    });

    test('extracts the low', () {
      final forecast = DailyForecast.fromJson(json);
      expect(forecast.low, 290.37);
    });

    test('extracts the high', () {
      final forecast = DailyForecast.fromJson(json);
      expect(forecast.high, 302.59);
    });

    test('extracts and creates the condition', () {
      final condition = Condition.fromRawCondition(800);
      final forecast = DailyForecast.fromJson(json);
      expect(forecast.condition, condition);
    });

    test('handles integer temperatures', () {
      const intJson = {
        'dt': 1642226400,
        'temp': {
          'min': 290,
          'max': 302,
        },
        'weather': [
          {
            'id': 800,
            'main': 'Clear',
            'description': 'clear sky',
            'icon': '01d',
          },
        ],
      };
      final forecast = DailyForecast.fromJson(intJson);
      expect(forecast.low, 290.0);
      expect(forecast.high, 302.0);
    });
  });
}
