class _ImagePaths {
  static const cloudy = 'assets/images/cloudy.png';
  static const fog = 'assets/images/fog.png';
  static const lightRain = 'assets/images/light-rain.png';
  static const shower = 'assets/images/-shower.png';
  static const snow = 'assets/images/snow.png';
  static const sunny = 'assets/images/sunny.png';
  static const sunnyThunderstorm = 'assets/images/sunny-tstorm.png';
  static const thunderstorm = 'assets/images/tstorm.png';
  static const unknown = 'assets/images/unknown.png';
}

class Condition {
  final String title;
  final String description;
  final String image;

  const Condition(
      {required this.title, required this.description, required this.image});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition.fromRawCondition(json['weather'][0]['id'] as int);
  }

  factory Condition.fromRawCondition(int rawCondition) {
    switch (rawCondition) {
      case 200:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm with light rain',
          image: _ImagePaths.thunderstorm,
        );
      case 201:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm with rain',
          image: _ImagePaths.thunderstorm,
        );
      case 202:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm with heavy rain',
          image: _ImagePaths.thunderstorm,
        );
      case 210:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Light thunderstorm',
          image: _ImagePaths.thunderstorm,
        );
      case 211:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm',
          image: _ImagePaths.thunderstorm,
        );
      case 212:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Heavy thunderstorm',
          image: _ImagePaths.thunderstorm,
        );
      case 221:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Ragged thunderstorm',
          image: _ImagePaths.sunnyThunderstorm,
        );
      case 230:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm with light drizzle',
          image: _ImagePaths.sunnyThunderstorm,
        );
      case 231:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm with drizzle',
          image: _ImagePaths.sunnyThunderstorm,
        );
      case 232:
        return const Condition(
          title: 'Thunderstorm',
          description: 'Thunderstorm with heavy drizzle',
          image: _ImagePaths.sunnyThunderstorm,
        );
      case 300:
        return const Condition(
          title: 'Drizzle',
          description: 'Light drizzle',
          image: _ImagePaths.lightRain,
        );
      case 301:
        return const Condition(
          title: 'Drizzle',
          description: 'Drizzle',
          image: _ImagePaths.lightRain,
        );
      case 302:
        return const Condition(
          title: 'Drizzle',
          description: 'Heavy drizzle',
          image: _ImagePaths.lightRain,
        );
      case 310:
        return const Condition(
          title: 'Drizzle',
          description: 'Light drizzle',
          image: _ImagePaths.lightRain,
        );
      case 311:
        return const Condition(
          title: 'Drizzle',
          description: 'Drizzle',
          image: _ImagePaths.lightRain,
        );
      case 312:
        return const Condition(
          title: 'Drizzle',
          description: 'Heavy drizzle',
          image: _ImagePaths.lightRain,
        );
      case 313:
        return const Condition(
          title: 'Drizzle',
          description: 'Light drizzle',
          image: _ImagePaths.lightRain,
        );
      case 314:
        return const Condition(
          title: 'Drizzle',
          description: 'Drizzle',
          image: _ImagePaths.lightRain,
        );
      case 315:
        return const Condition(
          title: 'Drizzle',
          description: 'Heavy drizzle',
          image: _ImagePaths.lightRain,
        );
      case 500:
        return const Condition(
          title: 'Light rain',
          description: 'Light rain',
          image: _ImagePaths.lightRain,
        );
      case 501:
        return const Condition(
          title: 'Light rain',
          description: 'Moderate rain',
          image: _ImagePaths.lightRain,
        );
      case 502:
        return const Condition(
          title: 'Rain',
          description: 'Heavy rain',
          image: _ImagePaths.shower,
        );
      case 503:
        return const Condition(
          title: 'Rain',
          description: 'Very heavy rain',
          image: _ImagePaths.shower,
        );
      case 504:
        return const Condition(
          title: 'Shower',
          description: 'Extreme rain',
          image: _ImagePaths.shower,
        );
      case 505:
        return const Condition(
          title: 'Freezing rain',
          description: 'Freezing rain',
          image: _ImagePaths.shower,
        );
      case 520:
        return const Condition(
          title: 'Shower',
          description: 'Light shower',
          image: _ImagePaths.lightRain,
        );
      case 521:
        return const Condition(
          title: 'Shower',
          description: 'Shower',
          image: _ImagePaths.shower,
        );
      case 522:
        return const Condition(
          title: 'Shower',
          description: 'Heavy shower',
          image: _ImagePaths.shower,
        );
      case 523:
        return const Condition(
          title: 'Shower',
          description: 'Ragged shower',
          image: _ImagePaths.shower,
        );
      case 600:
        return const Condition(
          title: 'Snow',
          description: 'Light snow',
          image: _ImagePaths.snow,
        );
      case 601:
        return const Condition(
          title: 'Snow',
          description: 'Snow',
          image: _ImagePaths.snow,
        );
      case 602:
        return const Condition(
          title: 'Snow',
          description: 'Heavy snow',
          image: _ImagePaths.snow,
        );
      case 611:
        return const Condition(
          title: 'Sleet',
          description: 'Sleet',
          image: _ImagePaths.snow,
        );
      case 612:
        return const Condition(
          title: 'Sleet',
          description: 'Light sleet',
          image: _ImagePaths.snow,
        );
      case 613:
        return const Condition(
          title: 'Sleet',
          description: 'Shower sleet',
          image: _ImagePaths.snow,
        );
      case 615:
        return const Condition(
          title: 'Mixed snow',
          description: 'Light rain and snow',
          image: _ImagePaths.snow,
        );
      case 616:
        return const Condition(
          title: 'Mixed snow',
          description: 'Rain and snow',
          image: _ImagePaths.snow,
        );
      case 620:
        return const Condition(
          title: 'Mixed snow',
          description: 'Light shower snow',
          image: _ImagePaths.snow,
        );
      case 621:
        return const Condition(
          title: 'Mixed snow',
          description: 'Shower snow',
          image: _ImagePaths.snow,
        );
      case 622:
        return const Condition(
          title: 'Mixed snow',
          description: 'Heavy shower snow',
          image: _ImagePaths.snow,
        );
      case 701:
        return const Condition(
          title: 'Mist',
          description: 'Mist',
          image: _ImagePaths.fog,
        );
      case 711:
        return const Condition(
          title: 'Smoke',
          description: 'Smoke',
          image: _ImagePaths.fog,
        );
      case 721:
        return const Condition(
          title: 'Haze',
          description: 'Haze',
          image: _ImagePaths.fog,
        );
      case 731:
        return const Condition(
          title: 'Dust',
          description: 'Dust',
          image: _ImagePaths.fog,
        );
      case 741:
        return const Condition(
          title: 'Fog',
          description: 'Fog',
          image: _ImagePaths.fog,
        );
      case 751:
        return const Condition(
          title: 'Sand',
          description: 'Sand',
          image: _ImagePaths.fog,
        );
      case 761:
        return const Condition(
          title: 'Dust',
          description: 'Dust',
          image: _ImagePaths.fog,
        );
      case 762:
        return const Condition(
          title: 'Ash',
          description: 'Volcanic ash',
          image: _ImagePaths.fog,
        );
      case 771:
        return const Condition(
          title: 'Squalls',
          description: 'Squalls',
          image: _ImagePaths.thunderstorm,
        );
      case 781:
        return const Condition(
          title: 'Tornado',
          description: 'Tornado',
          image: _ImagePaths.thunderstorm,
        );
      case 800:
        return const Condition(
          title: 'Clear',
          description: 'Clear',
          image: _ImagePaths.sunny,
        );
      case 801:
        return const Condition(
          title: 'Clouds',
          description: 'Few clouds',
          image: _ImagePaths.cloudy,
        );
      case 802:
        return const Condition(
          title: 'Clouds',
          description: 'Scattered clouds',
          image: _ImagePaths.cloudy,
        );
      case 803:
        return const Condition(
          title: 'Clouds',
          description: 'Broken clouds',
          image: _ImagePaths.cloudy,
        );
      case 804:
        return const Condition(
          title: 'Clouds',
          description: 'Overcast clouds',
          image: _ImagePaths.cloudy,
        );
      default:
        return const Condition(
          title: 'unknown',
          description: 'unknown',
          image: _ImagePaths.unknown,
        );
    }
  }
}
