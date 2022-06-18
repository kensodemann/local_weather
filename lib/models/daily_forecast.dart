import 'package:local_weather/models/condition.dart';

class DailyForecast {
  DateTime date;
  Condition condition;
  double high;
  double low;

  DailyForecast({
    required this.date,
    required this.high,
    required this.low,
    required this.condition,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      condition: Condition.fromJson(json),
      low: json['temp']['min'] as double,
      high: json['temp']['max'] as double,
    );
  }
}
