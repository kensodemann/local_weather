import 'package:flutter/material.dart';
import 'package:local_weather/widgets/temperature.dart';

class TemperatureRow extends StatelessWidget {
  final String label;
  final double temperature;

  const TemperatureRow({
    Key? key,
    required this.label,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          '$label:',
          style: theme.textTheme.titleSmall,
        ),
        const Spacer(),
        Temperature(
          temperature,
          style: theme.textTheme.titleSmall,
        )
      ],
    );
  }
}
