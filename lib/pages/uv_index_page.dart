import 'package:flutter/material.dart';
import 'package:local_weather/models/uv_condition.dart';
import 'package:local_weather/models/weather.dart';
import 'package:provider/provider.dart';

class UVIndexPage extends StatelessWidget {
  static const _uvRiskColor = [
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
  ];

  const UVIndexPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<Weather>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            '${weather.uvCondition.uvIndex.toStringAsFixed(1)} ${weather.uvCondition.description}',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: _uvRiskColor[weather.uvCondition.riskFactor]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            weather.uvCondition.advice,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
