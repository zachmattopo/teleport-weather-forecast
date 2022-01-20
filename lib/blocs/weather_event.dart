part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class StarterWeatherRequested extends WeatherEvent {
  final List<int> locIdList;

  const StarterWeatherRequested({@required this.locIdList})
      : assert(locIdList != null);

  @override
  List<Object> get props => [locIdList];

  @override
  String toString() => 'StarterWeatherRequested { locIdList: $locIdList }';
}

class WeatherViaLocIdRequested extends WeatherEvent {
  final int locId;

  const WeatherViaLocIdRequested({@required this.locId})
      : assert(locId != null);

  @override
  List<Object> get props => [locId];

  @override
  String toString() => 'WeatherViaLocIdRequested { locId: $locId }';
}

class WeatherViaLatLongRequested extends WeatherEvent {
  final double lat;
  final double long;

  const WeatherViaLatLongRequested({
    @required this.lat,
    @required this.long,
  }) : assert(lat != null && long != null);

  @override
  List<Object> get props => [
        lat,
        long,
      ];

      @override
  String toString() => 'WeatherViaLatLongRequested { lat: $lat, long: $long }';
}
