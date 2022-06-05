import 'package:flutter/material.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Current Weather',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
