import 'package:flutter/material.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/widgets/condition_image.dart';
import 'package:local_weather/widgets/condition_text.dart';
import 'package:local_weather/widgets/temperature.dart';
import 'package:provider/provider.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<Weather>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'Madison, WI',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          Temperature(
            temperature: weather.temperature,
            scale: Scale.fahrenheit,
          ),
          const SizedBox(
            height: 20,
          ),
          ConditionImage(condition: weather.condition, size: 192),
          ConditionText(condition: weather.condition),
        ],
      ),
    );
  }
}
