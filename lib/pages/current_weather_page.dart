import 'package:flutter/material.dart';
import 'package:local_weather/models/current_location.dart';
import 'package:local_weather/models/user_preferences.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/widgets/condition_image.dart';
import 'package:local_weather/widgets/condition_text.dart';
import 'package:local_weather/widgets/temperature.dart';
import 'package:provider/provider.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<CurrentLocation>(context);
    final weather = Provider.of<Weather>(context);
    final userPreferences =
        Provider.of<UserPreferences>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            location.locationName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () => userPreferences.toggleScale(),
            child: Temperature(weather.temperature),
          ),
          const SizedBox(
            height: 20,
          ),
          ConditionImage(
            weather.condition,
            size: 192,
          ),
          ConditionText(weather.condition),
        ],
      ),
    );
  }
}
