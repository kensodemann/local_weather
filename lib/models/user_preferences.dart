import 'package:flutter/cupertino.dart';
import 'package:local_weather/widgets/temperature.dart';

class UserPreferences with ChangeNotifier {
  Scale _scale = Scale.fahrenheit;

  Scale get scale => _scale;

  void toggleScale() {
    _scale = _scale == Scale.fahrenheit ? Scale.celsius : Scale.fahrenheit;
    notifyListeners();
  }
}
