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

  String get _image {
    switch (condition) {
      case Condition.cloudy:
        return 'assets/images/cloudy.png';
      case Condition.fog:
        return 'assets/images/fog.png';
      case Condition.lightRain:
        return 'assets/images/light-rain.png';
      case Condition.shower:
        return 'assets/images/-shower.png';
      case Condition.snow:
        return 'assets/images/snow.png';
      case Condition.sunny:
        return 'assets/images/sunny.png';
      case Condition.sunnyThunderStorm:
        return 'assets/images/sunny-tstorm.png';
      case Condition.thunderStorm:
        return 'assets/images/tstorm.png';
      default:
        return 'assets/images/unknown.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 100,
      height: size ?? 100,
      child: Image.asset(
        _image,
        fit: BoxFit.cover,
      ),
    );
  }
}
