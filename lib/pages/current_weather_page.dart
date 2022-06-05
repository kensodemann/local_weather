import 'package:flutter/material.dart';
import 'package:local_weather/models/condition.dart';
import 'package:local_weather/widgets/condition_image.dart';
import 'package:local_weather/widgets/condition_text.dart';
import 'package:local_weather/widgets/temperature.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Temperature(
            temperature: 283.45,
            scale: Scale.fahrenheit,
          ),
          const SizedBox(
            height: 20,
          ),
          const ConditionImage(condition: Condition.sunny, size: 200),
          const ConditionText(condition: Condition.sunny),
        ],
      ),
    );
  }
}
