import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_weather/models/weather.dart';
import 'package:local_weather/widgets/condition_image.dart';
import 'package:local_weather/widgets/condition_text.dart';
import 'package:local_weather/widgets/temperature.dart';
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
        final theme = Theme.of(ctx);
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ConditionImage(
                condition: forecasts[index].condition,
                size: 72,
              ),
              const Expanded(
                child: Spacer(),
              ),
              SizedBox(
                width: 212,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMEd().format(forecasts[index].date),
                      style: theme.textTheme.titleMedium,
                    ),
                    ConditionText(
                      condition: forecasts[index].condition,
                      style: theme.textTheme.titleSmall,
                    ),
                    Row(
                      children: [
                        Text(
                          'Low:',
                          style: theme.textTheme.titleSmall,
                        ),
                        const Expanded(
                          child: Spacer(),
                        ),
                        Temperature(
                          temperature: forecasts[index].low,
                          scale: Scale.fahrenheit,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'High:',
                          style: theme.textTheme.titleSmall,
                        ),
                        const Expanded(
                          child: Spacer(),
                        ),
                        Temperature(
                          temperature: forecasts[index].high,
                          scale: Scale.fahrenheit,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
