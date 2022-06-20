import 'package:flutter/material.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:provider/provider.dart';

enum Scale {
  celsius,
  fahrenheit,
}

class Temperature extends StatelessWidget {
  final double temperature;
  final TextStyle? style;

  const Temperature(
    this.temperature, {
    Key? key,
    this.style,
  }) : super(key: key);

  String get _celsius {
    return '${(temperature - 273.15).toStringAsFixed(0)} ℃';
  }

  String get _fahrenheit {
    return '${((temperature * 9) / 5 - 459.67).toStringAsFixed(0)} ℉';
  }

  @override
  Widget build(BuildContext context) {
    final scale = Provider.of<UserPreferences>(context).scale;
    return Text(
      scale == Scale.celsius ? _celsius : _fahrenheit,
      style: style ?? Theme.of(context).textTheme.titleMedium,
    );
  }
}
