import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/uv_condition.dart';

class Weather with ChangeNotifier {
  Condition _condition = Condition.fromRawCondition(0);
  double _temperature = 0;
  UVCondition _uvCondition = UVCondition.fromIndex(0);

  Condition get condition => _condition;
  double get temperature => _temperature;
  UVCondition get uvCondition => _uvCondition;

  Future<void> load() async {
    final url = Uri.https('api.openweathermap.org', '/data/2.5/onecall', {
      'lat': '43.074085',
      'lon': '-89.381027',
      'exclude': 'minutely',
      'appid': dotenv.env['WEATHER_KEY'],
    });
    final response = await http.get(url);
    final rawData = json.decode(response.body);
    _temperature = rawData['current']['temp'] as double;
    _condition =
        Condition.fromRawCondition(rawData['current']['weather'][0]['id']);
    _uvCondition = UVCondition.fromIndex(rawData['current']['uvi']);
    notifyListeners();
  }
}
