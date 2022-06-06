import 'package:flutter/material.dart';
import 'package:local_weather/models/condition.dart';

class ConditionImage extends StatelessWidget {
  final Condition condition;
  final double? size;

  const ConditionImage({
    Key? key,
    required this.condition,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 100,
      height: size ?? 100,
      child: Image.asset(
        condition.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
