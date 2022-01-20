import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:teleport_weather_forecast/apis/apis.dart';
import 'package:teleport_weather_forecast/models/models.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final OpenWeatherApiClient openWeatherApiClient;

  WeatherBloc({@required this.openWeatherApiClient}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is StarterWeatherRequested) {
        emit(const WeatherLoadInProgress());

        try {
          List<Weather> weatherList = [];

          for (final locId in event.locIdList) {
            Weather weather =
                await openWeatherApiClient.getCurrentWeatherByLocId(locId);
            weatherList.add(weather);
          }

          emit(StarterWeatherLoadSuccess(weatherList: weatherList));
        } catch (_) {
          emit(WeatherLoadFailure());
        }
      } else if (event is WeatherViaLocIdRequested ||
          event is WeatherViaLatLongRequested) {
        emit(const WeatherLoadInProgress());

        try {
          Weather weather;

          if (event is WeatherViaLocIdRequested) {
            weather = await openWeatherApiClient
                .getCurrentWeatherByLocId(event.locId);
          } else if (event is WeatherViaLatLongRequested) {
            weather = await openWeatherApiClient.getCurrentWeatherByLatLong(
                event.lat, event.long);
          }

          emit(WeatherLoadSuccess(weather: weather));
        } catch (_) {
          emit(const WeatherLoadFailure());
        }
      }
    });
  }
}
