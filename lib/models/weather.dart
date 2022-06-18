import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/models/daily_forcast.dart';
import 'package:local_weather/models/uv_condition.dart';

class Weather with ChangeNotifier {
  Condition _condition = Condition.fromRawCondition(0);
  double _temperature = 0;
  UVCondition _uvCondition = UVCondition.fromIndex(0);
  List<DailyForecast> _dailyForecasts = [];

  Condition get condition => _condition;
  double get temperature => _temperature;
  UVCondition get uvCondition => _uvCondition;
  List<DailyForecast> get dailyForecasts => [..._dailyForecasts];

  Future<void> load() async {
    final url = Uri.https('api.openweathermap.org', '/data/2.5/onecall', {
      'lat': '43.074085',
      'lon': '-89.381027',
      'exclude': 'minutely',
      'appid': dotenv.env['WEATHER_KEY'],
    });
    final response = await http.get(url);
    final rawData = json.decode(response.body);
    final daily = rawData['daily'].toList();
    _temperature = rawData['current']['temp'] as double;
    _condition = Condition.fromJson(rawData['current']);
    _uvCondition = UVCondition.fromJson(rawData['current']);
    _dailyForecasts =
        daily.map<DailyForecast>((d) => DailyForecast.fromJson(d)).toList();
    notifyListeners();
  }
}
