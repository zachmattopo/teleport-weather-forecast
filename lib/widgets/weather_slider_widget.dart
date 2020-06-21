import 'package:carsome_weather/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsome_weather/models/weather.dart';

class WeatherSliderWidget extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherSliderWidget({
    Key key,
    @required this.weatherList,
  })  : assert(weatherList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          // height: 400.0,
          aspectRatio: 0.63,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
        ),
        itemCount: weatherList.length,
        itemBuilder: (BuildContext context, int index) {
          final weather = weatherList[index];
          final location = weather.location;
          final condition = weather.condition;
          final formattedCondition = weather.formattedCondition;
          final temp = weather.temp;
          final maxTemp = weather.maxTemp;
          final minTemp = weather.minTemp;

          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(color: Colors.amber),
            child: Column(
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
