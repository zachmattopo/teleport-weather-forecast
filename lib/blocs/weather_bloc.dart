import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carsome_weather/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:carsome_weather/apis/apis.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final OpenWeatherApiClient openWeatherApiClient;

  WeatherBloc({@required this.openWeatherApiClient})
      : assert(openWeatherApiClient != null);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherViaLocIdRequested || event is WeatherViaLatLongRequested) {
      yield WeatherLoadInProgress();

      try {
        Weather weather;

        if (event is WeatherViaLocIdRequested) {
          weather =
            await openWeatherApiClient.getCurrentWeatherByLocId(event.locId);
        } else if (event is WeatherViaLatLongRequested) {
          weather =
            await openWeatherApiClient.getCurrentWeatherByLatLong(event.lat, event.long);
        }
        
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
