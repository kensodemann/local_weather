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
}
