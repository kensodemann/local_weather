import 'package:flutter/material.dart';

enum Scale {
  celsius,
  fahrenheit,
}

class Temperature extends StatelessWidget {
  final double temperature;
  final Scale scale;

  const Temperature({Key? key, required this.temperature, required this.scale})
      : super(key: key);

  String get _celsius {
    return '${(temperature - 273.15).toStringAsFixed(0)} ℃';
  }

  String get _fahrenheit {
    return '${((temperature * 9) / 5 - 459.67).toStringAsFixed(0)} ℉';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      scale == Scale.celsius ? _celsius : _fahrenheit,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
