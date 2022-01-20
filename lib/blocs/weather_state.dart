part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {
  const WeatherLoadInProgress();

  @override
  String toString() => 'WeatherLoadInProgress';
}

class StarterWeatherLoadSuccess extends WeatherState {
  final List<Weather> weatherList;

  StarterWeatherLoadSuccess({@required this.weatherList})
      : assert(weatherList != null);

  @override
  List<Object> get props => [weatherList];

  @override
  String toString() =>
      'StarterWeatherLoadSuccess { weatherList: $weatherList }';
}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  const WeatherLoadSuccess({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];

  @override
  String toString() => 'WeatherLoadSuccess { weather: $weather }';
}

class WeatherLoadFailure extends WeatherState {
  const WeatherLoadFailure();

  @override
  String toString() => 'WeatherLoadFailure';
}
