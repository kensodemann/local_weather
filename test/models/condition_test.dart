import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/condition.dart';

void main() {
  group('from raw condition number', () {
    const cloudy = 'assets/images/cloudy.png';
    const fog = 'assets/images/fog.png';
    const lightRain = 'assets/images/light-rain.png';
    const shower = 'assets/images/shower.png';
    const snow = 'assets/images/snow.png';
    const sunny = 'assets/images/sunny.png';
    const sunnyThunderstorm = 'assets/images/sunny-tstorm.png';
    const thunderstorm = 'assets/images/tstorm.png';
    const unknown = 'assets/images/unknown.png';

    test('unknown', () {
      final condition = Condition.fromRawCondition(666);
      expect(condition.title, 'unknown');
      expect(condition.description, 'unknown');
      expect(condition.image, unknown);
    });

    test('200', () {
      final condition = Condition.fromRawCondition(200);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm with light rain');
      expect(condition.image, thunderstorm);
    });

    test('201', () {
      final condition = Condition.fromRawCondition(201);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm with rain');
      expect(condition.image, thunderstorm);
    });

    test('202', () {
      final condition = Condition.fromRawCondition(202);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm with heavy rain');
      expect(condition.image, thunderstorm);
    });

    test('210', () {
      final condition = Condition.fromRawCondition(210);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Light thunderstorm');
      expect(condition.image, thunderstorm);
    });

    test('211', () {
      final condition = Condition.fromRawCondition(211);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm');
      expect(condition.image, thunderstorm);
    });

    test('212', () {
      final condition = Condition.fromRawCondition(212);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Heavy thunderstorm');
      expect(condition.image, thunderstorm);
    });

    test('221', () {
      final condition = Condition.fromRawCondition(221);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Ragged thunderstorm');
      expect(condition.image, sunnyThunderstorm);
    });

    test('230', () {
      final condition = Condition.fromRawCondition(230);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm with light drizzle');
      expect(condition.image, sunnyThunderstorm);
    });

    test('231', () {
      final condition = Condition.fromRawCondition(231);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm with drizzle');
      expect(condition.image, sunnyThunderstorm);
    });

    test('232', () {
      final condition = Condition.fromRawCondition(232);
      expect(condition.title, 'Thunderstorm');
      expect(condition.description, 'Thunderstorm with heavy drizzle');
      expect(condition.image, sunnyThunderstorm);
    });

    test('300', () {
      final condition = Condition.fromRawCondition(300);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Light drizzle');
      expect(condition.image, lightRain);
    });

    test('301', () {
      final condition = Condition.fromRawCondition(301);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Drizzle');
      expect(condition.image, lightRain);
    });

    test('302', () {
      final condition = Condition.fromRawCondition(302);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Heavy drizzle');
      expect(condition.image, lightRain);
    });

    test('310', () {
      final condition = Condition.fromRawCondition(310);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Light drizzle');
      expect(condition.image, lightRain);
    });

    test('311', () {
      final condition = Condition.fromRawCondition(311);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Drizzle');
      expect(condition.image, lightRain);
    });

    test('312', () {
      final condition = Condition.fromRawCondition(312);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Heavy drizzle');
      expect(condition.image, lightRain);
    });

    test('313', () {
      final condition = Condition.fromRawCondition(313);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Rain and drizzle');
      expect(condition.image, lightRain);
    });

    test('314', () {
      final condition = Condition.fromRawCondition(314);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Heavy drizzle');
      expect(condition.image, lightRain);
    });

    test('321', () {
      final condition = Condition.fromRawCondition(321);
      expect(condition.title, 'Drizzle');
      expect(condition.description, 'Shower drizzle');
      expect(condition.image, shower);
    });

    test('500', () {
      final condition = Condition.fromRawCondition(500);
      expect(condition.title, 'Rain');
      expect(condition.description, 'Light rain');
      expect(condition.image, lightRain);
    });

    test('501', () {
      final condition = Condition.fromRawCondition(501);
      expect(condition.title, 'Rain');
      expect(condition.description, 'Rain');
      expect(condition.image, shower);
    });

    test('502', () {
      final condition = Condition.fromRawCondition(502);
      expect(condition.title, 'Rain');
      expect(condition.description, 'Heavy rain');
      expect(condition.image, shower);
    });

    test('503', () {
      final condition = Condition.fromRawCondition(503);
      expect(condition.title, 'Rain');
      expect(condition.description, 'Very heavy rain');
      expect(condition.image, shower);
    });

    test('504', () {
      final condition = Condition.fromRawCondition(504);
      expect(condition.title, 'Shower');
      expect(condition.description, 'Extreme rain');
      expect(condition.image, shower);
    });

    test('511', () {
      final condition = Condition.fromRawCondition(511);
      expect(condition.title, 'Freezing rain');
      expect(condition.description, 'Freezing rain');
      expect(condition.image, shower);
    });

    test('520', () {
      final condition = Condition.fromRawCondition(520);
      expect(condition.title, 'Shower');
      expect(condition.description, 'Light shower');
      expect(condition.image, lightRain);
    });

    test('521', () {
      final condition = Condition.fromRawCondition(521);
      expect(condition.title, 'Shower');
      expect(condition.description, 'Shower');
      expect(condition.image, shower);
    });

    test('522', () {
      final condition = Condition.fromRawCondition(522);
      expect(condition.title, 'Shower');
      expect(condition.description, 'Heavy shower');
      expect(condition.image, shower);
    });

    test('531', () {
      final condition = Condition.fromRawCondition(531);
      expect(condition.title, 'Shower');
      expect(condition.description, 'Ragged shower');
      expect(condition.image, shower);
    });

    test('600', () {
      final condition = Condition.fromRawCondition(600);
      expect(condition.title, 'Snow');
      expect(condition.description, 'Light snow');
      expect(condition.image, snow);
    });

    test('601', () {
      final condition = Condition.fromRawCondition(601);
      expect(condition.title, 'Snow');
      expect(condition.description, 'Snow');
      expect(condition.image, snow);
    });

    test('602', () {
      final condition = Condition.fromRawCondition(602);
      expect(condition.title, 'Snow');
      expect(condition.description, 'Heavy snow');
      expect(condition.image, snow);
    });

    test('611', () {
      final condition = Condition.fromRawCondition(611);
      expect(condition.title, 'Sleet');
      expect(condition.description, 'Sleet');
      expect(condition.image, snow);
    });

    test('612', () {
      final condition = Condition.fromRawCondition(612);
      expect(condition.title, 'Sleet');
      expect(condition.description, 'Light sleet');
      expect(condition.image, snow);
    });

    test('613', () {
      final condition = Condition.fromRawCondition(613);
      expect(condition.title, 'Sleet');
      expect(condition.description, 'Shower sleet');
      expect(condition.image, snow);
    });

    test('615', () {
      final condition = Condition.fromRawCondition(615);
      expect(condition.title, 'Rain and snow');
      expect(condition.description, 'Light rain and snow');
      expect(condition.image, snow);
    });

    test('616', () {
      final condition = Condition.fromRawCondition(616);
      expect(condition.title, 'Rain and snow');
      expect(condition.description, 'Mixed rain and snow');
      expect(condition.image, snow);
    });

    test('620', () {
      final condition = Condition.fromRawCondition(620);
      expect(condition.title, 'Snow');
      expect(condition.description, 'Light snow shower');
      expect(condition.image, snow);
    });

    test('621', () {
      final condition = Condition.fromRawCondition(621);
      expect(condition.title, 'Snow');
      expect(condition.description, 'Snow shower');
      expect(condition.image, snow);
    });

    test('622', () {
      final condition = Condition.fromRawCondition(622);
      expect(condition.title, 'Snow');
      expect(condition.description, 'Heavy snow shower');
      expect(condition.image, snow);
    });

    test('701', () {
      final condition = Condition.fromRawCondition(701);
      expect(condition.title, 'Mist');
      expect(condition.description, 'Mist');
      expect(condition.image, fog);
    });

    test('711', () {
      final condition = Condition.fromRawCondition(711);
      expect(condition.title, 'Smoke');
      expect(condition.description, 'Smoke');
      expect(condition.image, fog);
    });

    test('721', () {
      final condition = Condition.fromRawCondition(721);
      expect(condition.title, 'Haze');
      expect(condition.description, 'Haze');
      expect(condition.image, fog);
    });

    test('731', () {
      final condition = Condition.fromRawCondition(731);
      expect(condition.title, 'Dust');
      expect(condition.description, 'Dust');
      expect(condition.image, fog);
    });

    test('741', () {
      final condition = Condition.fromRawCondition(741);
      expect(condition.title, 'Fog');
      expect(condition.description, 'Fog');
      expect(condition.image, fog);
    });

    test('751', () {
      final condition = Condition.fromRawCondition(751);
      expect(condition.title, 'Sand');
      expect(condition.description, 'Sand');
      expect(condition.image, fog);
    });

    test('761', () {
      final condition = Condition.fromRawCondition(761);
      expect(condition.title, 'Dust');
      expect(condition.description, 'Dust');
      expect(condition.image, fog);
    });

    test('762', () {
      final condition = Condition.fromRawCondition(762);
      expect(condition.title, 'Ash');
      expect(condition.description, 'Volcanic ash');
      expect(condition.image, fog);
    });

    test('771', () {
      final condition = Condition.fromRawCondition(771);
      expect(condition.title, 'Squalls');
      expect(condition.description, 'Squalls');
      expect(condition.image, thunderstorm);
    });

    test('781', () {
      final condition = Condition.fromRawCondition(781);
      expect(condition.title, 'Tornado');
      expect(condition.description, 'Tornado');
      expect(condition.image, thunderstorm);
    });

    test('800', () {
      final condition = Condition.fromRawCondition(800);
      expect(condition.title, 'Clear');
      expect(condition.description, 'Clear sky');
      expect(condition.image, sunny);
    });

    test('801', () {
      final condition = Condition.fromRawCondition(801);
      expect(condition.title, 'Clouds');
      expect(condition.description, 'Few clouds');
      expect(condition.image, cloudy);
    });

    test('802', () {
      final condition = Condition.fromRawCondition(802);
      expect(condition.title, 'Clouds');
      expect(condition.description, 'Scattered clouds');
      expect(condition.image, cloudy);
    });

    test('803', () {
      final condition = Condition.fromRawCondition(803);
      expect(condition.title, 'Clouds');
      expect(condition.description, 'Broken clouds');
      expect(condition.image, cloudy);
    });

    test('804', () {
      final condition = Condition.fromRawCondition(804);
      expect(condition.title, 'Clouds');
      expect(condition.description, 'Overcast clouds');
      expect(condition.image, cloudy);
    });
  });

  group('from JSON', () {
    test('uses the first weather object', () {
      const json = {
        'weather': [
          {
            'id': 800,
          },
          {
            'id': 801,
          }
        ]
      };
      final condition = Condition.fromJson(json);
      final expectedCondition = Condition.fromRawCondition(800);
      expect(condition, expectedCondition);
    });
  });
}
