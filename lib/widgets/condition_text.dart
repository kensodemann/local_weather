import 'package:flutter/material.dart';
import 'package:local_weather/models/condition.dart';

class ConditionText extends StatelessWidget {
  final Condition condition;
  final TextStyle? style;

  const ConditionText({
    Key? key,
    required this.condition,
    this.style,
  }) : super(key: key);

  String get _text {
    switch (condition) {
      case Condition.cloudy:
        return 'Cloudy';
      case Condition.fog:
        return 'Foggy';
      case Condition.lightRain:
        return 'Light Rain';
      case Condition.shower:
        return 'Rain Showers';
      case Condition.snow:
        return 'Snow';
      case Condition.sunny:
        return 'Sunny';
      case Condition.sunnyThunderStorm:
        return 'Scattered Thunderstorms';
      case Condition.thunderStorm:
        return 'Thunderstorms';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: style ?? Theme.of(context).textTheme.titleMedium,
    );
  }
}
