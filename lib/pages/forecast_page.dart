import 'package:flutter/material.dart';
import 'package:local_weather/models/weather.dart';
import 'package:provider/provider.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecasts = Provider.of<Weather>(context).dailyForecasts;
    return ListView(
      children: forecasts
          .map(
            (forecast) => ListTile(
              leading: Text(forecast.date.toString()),
              title: Text(forecast.low.toString()),
              subtitle: Text(forecast.condition.description),
            ),
          )
          .toList(),
    );
  }
}
