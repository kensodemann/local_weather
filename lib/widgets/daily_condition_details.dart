import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_weather/models/daily_forecast.dart';
import 'package:local_weather/widgets/condition_text.dart';
import 'package:local_weather/widgets/temperature_row.dart';

class DailyConditionDetails extends StatelessWidget {
  final DailyForecast forecast;

  const DailyConditionDetails(
    this.forecast, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.yMMMEd().format(forecast.date),
          style: theme.textTheme.titleMedium,
        ),
        ConditionText(
          condition: forecast.condition,
          style: theme.textTheme.titleSmall,
        ),
        TemperatureRow(
          label: 'Low',
          temperature: forecast.low,
        ),
        TemperatureRow(
          label: 'High',
          temperature: forecast.high,
        ),
      ],
    );
  }
}
