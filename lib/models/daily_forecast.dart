import 'package:local_weather/models/condition.dart';

class DailyForecast {
  DateTime _date;
  Condition _condition;
  double _high;
  double _low;

  DailyForecast({
    required DateTime date,
    required double high,
    required double low,
    required Condition condition,
  })  : _date = date,
        _high = high,
        _low = low,
        _condition = condition;

  DateTime get date => _date;
  Condition get condition => _condition;
  double get high => _high;
  double get low => _low;

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      condition: Condition.fromJson(json),
      low: double.parse(json['temp']['min'].toString()),
      high: double.parse(json['temp']['max'].toString()),
    );
  }
}
