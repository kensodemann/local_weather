import 'package:flutter/material.dart';

class UVIndexPage extends StatelessWidget {
  final double uvIndex = 5.0;
  static const _uvRiskName = [
    'Low',
    'Moderate',
    'High',
    'Very High',
    'Extreme',
  ];

  static const _uvRiskColor = [
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
  ];

  static const _uvRiskDescription = [
    'Wear sunglasses on bright days. If you burn easily, cover up and use broad spectrum SPF 30+ sunscreen. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
    'Stay in the shade near midday when the sun is strongest. If outdoors, wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
    'Reduce time in the sun between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such sand, water and snow, will increase UV exposure.',
    'Minimize sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
    'Try to avoid sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
  ];

  const UVIndexPage({Key? key}) : super(key: key);

  int _getUvRisk(double uvIndex) {
    if (uvIndex < 3) {
      return 0;
    } else if (uvIndex < 6) {
      return 1;
    } else if (uvIndex < 8) {
      return 2;
    } else if (uvIndex < 11) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final risk = _getUvRisk(uvIndex);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '${uvIndex.toStringAsFixed(1)} ${_uvRiskName[risk]}',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: _uvRiskColor[risk]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            _uvRiskDescription[risk],
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
