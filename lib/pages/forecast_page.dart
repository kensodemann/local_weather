import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Forecasts',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
