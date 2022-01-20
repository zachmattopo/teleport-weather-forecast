import 'package:flutter/material.dart';
import 'package:teleport_weather_forecast/models/weather.dart';
import 'package:teleport_weather_forecast/widgets/widgets.dart';

class WeatherSliderWidget extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherSliderWidget({
    Key key,
    @required this.weatherList,
  })  : assert(weatherList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: weatherList.length,
        itemBuilder: (BuildContext context, int index) {
          final weather = weatherList[index];
          final location = weather.location;
          final condition = weather.condition;
          final formattedCondition = weather.formattedCondition;
          final temp = weather.temp;
          final maxTemp = weather.maxTemp;
          final minTemp = weather.minTemp;
    
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      location,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: ConditionWidget(
                    condition: condition,
                    stringCondition: formattedCondition,
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: TemperatureWidget(
                    temp: temp,
                    maxTemp: maxTemp,
                    minTemp: minTemp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
