import 'package:flutter_test/flutter_test.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/widgets/temperature.dart';

void main() {
  group('scale', () {
    test('should start with fahrenheit', () {
      final up = UserPreferences();
      expect(up.scale, Scale.fahrenheit);
    });

    test('should toggle back and forth', () {
      final up = UserPreferences();
      expect(up.scale, Scale.fahrenheit);
      up.toggleScale();
      expect(up.scale, Scale.celsius);
      up.toggleScale();
      expect(up.scale, Scale.fahrenheit);
    });
  });
}
