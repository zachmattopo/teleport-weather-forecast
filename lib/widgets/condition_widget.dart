import 'package:flutter/material.dart';

import 'package:teleport_weather_forecast/models/models.dart';

class ConditionWidget extends StatelessWidget {
  final WeatherCondition condition;
  final String stringCondition;

  ConditionWidget({Key key, @required this.condition, this.stringCondition})
      : assert(condition != null && stringCondition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        imagePath = 'assets/storm.png';
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.rain:
        imagePath = 'assets/rain.png';
        break;
      case WeatherCondition.snow:
        imagePath = 'assets/snow.png';
        break;
      case WeatherCondition.mist:
      case WeatherCondition.smoke:
      case WeatherCondition.haze:
      case WeatherCondition.dust:
      case WeatherCondition.fog:
      case WeatherCondition.sand:
      case WeatherCondition.ash:
        imagePath = 'assets/fog.png';
        break;
      case WeatherCondition.squall:
        imagePath = 'assets/windy-weather.png';
        break;
      case WeatherCondition.tornado:
        imagePath = 'assets/wind.png';
        break;
      case WeatherCondition.clear:
        TimeOfDay now = TimeOfDay.now();
        double nowDouble = now.hour + now.minute / 60.0;
        final nightTime = TimeOfDay(hour: 19, minute: 30);
        double nightTimeDouble = nightTime.hour + nightTime.minute / 60.0;

        imagePath = nowDouble > nightTimeDouble
            ? 'assets/moon-and-stars.png'
            : 'assets/sun-smiling.png';
        break;
      case WeatherCondition.clouds:
        imagePath = 'assets/clouds.png';
        break;
      case WeatherCondition.unknown:
        imagePath = 'assets/sun-smiling.png';
        break;
    }

    return Column(
      children: <Widget>[
        Text(
          '${stringCondition[0].toUpperCase()}${stringCondition.substring(1)} currently.',
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          imagePath,
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
