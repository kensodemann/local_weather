import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/uv_condition.dart';

void main() {
  group('From Index', () {
    test('0.0 is low', () {
      final uvCondition = UVCondition.fromIndex(0.0);
      expect(uvCondition.description, 'Low');
      expect(uvCondition.riskFactor, 0);
      expect(uvCondition.uvIndex, 0.0);
    });

    test('2.9 is low', () {
      final uvCondition = UVCondition.fromIndex(2.9);
      expect(uvCondition.description, 'Low');
      expect(uvCondition.riskFactor, 0);
      expect(uvCondition.uvIndex, 2.9);
    });

    test('3.0 is Moderate', () {
      final uvCondition = UVCondition.fromIndex(3.0);
      expect(uvCondition.description, 'Moderate');
      expect(uvCondition.riskFactor, 1);
      expect(uvCondition.uvIndex, 3.0);
    });

    test('5.9 is Moderate', () {
      final uvCondition = UVCondition.fromIndex(5.9);
      expect(uvCondition.description, 'Moderate');
      expect(uvCondition.riskFactor, 1);
      expect(uvCondition.uvIndex, 5.9);
    });

    test('6.0 is High', () {
      final uvCondition = UVCondition.fromIndex(6.0);
      expect(uvCondition.description, 'High');
      expect(uvCondition.riskFactor, 2);
      expect(uvCondition.uvIndex, 6.0);
    });

    test('7.9 is High', () {
      final uvCondition = UVCondition.fromIndex(7.9);
      expect(uvCondition.description, 'High');
      expect(uvCondition.riskFactor, 2);
      expect(uvCondition.uvIndex, 7.9);
    });

    test('8.0 is Very High', () {
      final uvCondition = UVCondition.fromIndex(8.0);
      expect(uvCondition.description, 'Very high');
      expect(uvCondition.riskFactor, 3);
      expect(uvCondition.uvIndex, 8.0);
    });

    test('10.9 is Very High', () {
      final uvCondition = UVCondition.fromIndex(10.9);
      expect(uvCondition.description, 'Very high');
      expect(uvCondition.riskFactor, 3);
      expect(uvCondition.uvIndex, 10.9);
    });

    test('11.0 is Extreme', () {
      final uvCondition = UVCondition.fromIndex(11.0);
      expect(uvCondition.description, 'Extreme');
      expect(uvCondition.riskFactor, 4);
      expect(uvCondition.uvIndex, 11.0);
    });

    test('15.0 is Extreme', () {
      final uvCondition = UVCondition.fromIndex(15.0);
      expect(uvCondition.description, 'Extreme');
      expect(uvCondition.riskFactor, 4);
      expect(uvCondition.uvIndex, 15.0);
    });
  });

  group('From JSON', () {
    test('uses the uvi', () {
      const json = {
        "dt": 1646318698,
        "sunrise": 1646306882,
        "sunset": 1646347929,
        "temp": 282.21,
        "feels_like": 278.41,
        "pressure": 1014,
        "humidity": 65,
        "dew_point": 275.99,
        "uvi": 2.55,
        "clouds": 40,
        "visibility": 10000,
        "wind_speed": 8.75,
        "wind_deg": 360,
        "wind_gust": 13.89,
        "weather": [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03d"
          }
        ]
      };

      final expectedUvCondition = UVCondition.fromIndex(2.55);
      final actualUvCondition = UVCondition.fromJson(json);
      expect(actualUvCondition.advice, expectedUvCondition.advice);
      expect(actualUvCondition.riskFactor, expectedUvCondition.riskFactor);
      expect(actualUvCondition.description, expectedUvCondition.description);
      expect(actualUvCondition.uvIndex, expectedUvCondition.uvIndex);
    });

    test('handles an integer index', () {
      const json = {
        "dt": 1646318698,
        "sunrise": 1646306882,
        "sunset": 1646347929,
        "temp": 282.21,
        "feels_like": 278.41,
        "pressure": 1014,
        "humidity": 65,
        "dew_point": 275.99,
        "uvi": 5,
        "clouds": 40,
        "visibility": 10000,
        "wind_speed": 8.75,
        "wind_deg": 360,
        "wind_gust": 13.89,
        "weather": [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03d"
          }
        ]
      };

      final expectedUvCondition = UVCondition.fromIndex(5.0);
      final actualUvCondition = UVCondition.fromJson(json);
      expect(actualUvCondition.advice, expectedUvCondition.advice);
      expect(actualUvCondition.riskFactor, expectedUvCondition.riskFactor);
      expect(actualUvCondition.description, expectedUvCondition.description);
      expect(actualUvCondition.uvIndex, expectedUvCondition.uvIndex);
    });
  });
}
