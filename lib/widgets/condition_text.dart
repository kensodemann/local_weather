import 'package:flutter/material.dart';
import 'package:local_weather/models/condition.dart';

class ConditionText extends StatelessWidget {
  final Condition condition;
  final TextStyle? style;

  const ConditionText({
    Key? key,
    required this.condition,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      condition.description,
      style: style ?? Theme.of(context).textTheme.titleMedium,
    );
  }
}
