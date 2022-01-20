import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teleport_weather_forecast/blocs/weather_bloc.dart';
import 'package:teleport_weather_forecast/utils/weather_util.dart';

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.refresh),
      onPressed: () {
        BlocProvider.of<WeatherBloc>(context).add(
          StarterWeatherRequested(locIdList: WeatherUtil.starterList),
        );
      },
    );
  }
}
