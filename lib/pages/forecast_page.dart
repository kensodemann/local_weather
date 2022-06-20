import 'package:flutter/material.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/widgets/condition_image.dart';
import 'package:local_weather/widgets/daily_condition_details.dart';
import 'package:provider/provider.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecasts = Provider.of<Weather>(context).dailyForecasts;
    return ListView.separated(
      itemCount: forecasts.length,
      separatorBuilder: (ctx, index) => const Divider(),
      itemBuilder: (ctx, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ConditionImage(
                forecasts[index].condition,
                size: 72,
              ),
              const Spacer(),
              SizedBox(
                width: 212,
                child: DailyConditionDetails(forecasts[index]),
              ),
            ],
          ),
        );
      },
    );
  }
}
