class UVCondition {
  final double _uvIndex;
  final int _riskFactor;
  final String _description;
  final String _advice;

  const UVCondition({
    required double uvIndex,
    required int riskFactor,
    required String description,
    required String advice,
  })  : _uvIndex = uvIndex,
        _riskFactor = riskFactor,
        _description = description,
        _advice = advice;

  double get uvIndex => _uvIndex;
  int get riskFactor => _riskFactor;
  String get description => _description;
  String get advice => _advice;

  factory UVCondition.fromJson(Map<String, dynamic> json) {
    final uvIndex = json['uvi'].toString();
    return UVCondition.fromIndex(double.parse(uvIndex));
  }

  factory UVCondition.fromIndex(double uvIndex) {
    if (uvIndex < 3) {
      return UVCondition(
        uvIndex: uvIndex,
        riskFactor: 0,
        description: 'Low',
        advice:
            'Wear sunglasses on bright days. If you burn easily, cover up and use broad spectrum SPF 30+ sunscreen. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
      );
    } else if (uvIndex < 6) {
      return UVCondition(
        uvIndex: uvIndex,
        riskFactor: 1,
        description: 'Moderate',
        advice:
            'Stay in the shade near midday when the sun is strongest. If outdoors, wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
      );
    } else if (uvIndex < 8) {
      return UVCondition(
        uvIndex: uvIndex,
        riskFactor: 2,
        description: 'High',
        advice:
            'Reduce time in the sun between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such sand, water and snow, will increase UV exposure.',
      );
    } else if (uvIndex < 11) {
      return UVCondition(
        uvIndex: uvIndex,
        riskFactor: 3,
        description: 'Very high',
        advice:
            'Minimize sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
      );
    } else {
      return UVCondition(
        uvIndex: uvIndex,
        riskFactor: 4,
        description: 'Extreme',
        advice:
            'Try to avoid sun exposure between 10 a.m. and 4 p.m. If outdoors, seek shade and wear sun protective clothing, a wide-brimmed hat, and UV-blocking sunglasses. Generously apply broad spectrum SPF 30+ sunscreen every 2 hours, even on cloudy days, and after swimming or sweating. Bright surfaces, such as sand, water and snow, will increase UV exposure.',
      );
    }
  }
}
