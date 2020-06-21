import 'package:flutter/material.dart';

import 'package:carsome_weather/models/models.dart';

class ConditionWidget extends StatelessWidget {
  final WeatherCondition condition;
  final String stringCondition;

  ConditionWidget(
      {Key key, @required this.condition, this.stringCondition})
      : assert(condition != null && stringCondition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/storm.png');
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.rain:
        image = Image.asset('assets/rain.png');
        break;
      case WeatherCondition.snow:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.mist:
      case WeatherCondition.smoke:
      case WeatherCondition.haze:
      case WeatherCondition.dust:
      case WeatherCondition.fog:
      case WeatherCondition.sand:
      case WeatherCondition.ash:
        image = Image.asset('assets/fog.png');
        break;
      case WeatherCondition.squall:
        image = Image.asset('assets/windy-weather.png');
        break;
      case WeatherCondition.tornado:
        image = Image.asset('assets/wind.png');
        break;
      case WeatherCondition.clear:
        TimeOfDay now = TimeOfDay.now();
        double nowDouble = now.hour + now.minute / 60.0;
        final nightTime = TimeOfDay(hour: 19, minute: 30);
        double nightTimeDouble = nightTime.hour + nightTime.minute / 60.0;

        image = nowDouble > nightTimeDouble
            ? Image.asset('assets/moon-and-stars.png')
            : Image.asset('assets/sun-smiling.png');
        break;
      case WeatherCondition.clouds:
        image = Image.asset('assets/clouds.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/sun-smiling.png');
        break;
    }

    return Column(
      children: <Widget>[
        Text(
          stringCondition,
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 20),
        image,
      ],
    );
  }
}
