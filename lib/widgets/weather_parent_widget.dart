import 'package:teleport_weather_forecast/blocs/weather_bloc.dart';
import 'package:teleport_weather_forecast/utils/weather_util.dart';
import 'package:teleport_weather_forecast/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherParentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(
      StarterWeatherRequested(locIdList: WeatherUtil.starterList),
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Teleport Weather'),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: Text(
                  'App is loading.\nThat, or it might be broken.',
                ),
              );
            }

            if (state is StarterWeatherLoadSuccess) {
              final weatherList = state.weatherList;
              return WeatherSliderWidget(weatherList: weatherList);
            }

            if (state is WeatherLoadSuccess) {
              // TODO: New location addition.
              // final weather = state.weather;

              // return ListView(
              //   children: <Widget>[
              //     Padding(
              //       padding: EdgeInsets.only(top: 100.0),
              //       child: Center(
              //         child: Location(location: weather.location),
              //       ),
              //     ),
              //     Center(
              //       child: LastUpdated(dateTime: weather.lastUpdated),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(vertical: 50.0),
              //       child: Center(
              //         child: CombinedWeatherTemperature(
              //           weather: weather,
              //         ),
              //       ),
              //     ),
              //   ],
              // );
            }

            if (state is WeatherLoadFailure) {
              return Center(
                child: Text(
                  'Something went wrong!',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            // State is `WeatherLoadInProgress`
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: RefreshButtonWidget(),
      ),
    );
  }
}
