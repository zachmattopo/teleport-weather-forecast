part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherViaLocIdRequested extends WeatherEvent {
  final int locId;

  const WeatherViaLocIdRequested({@required this.locId})
      : assert(locId != null);

  @override
  List<Object> get props => [locId];
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
}
