import 'package:equatable/equatable.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  mist,
  smoke,
  haze,
  dust,
  fog,
  sand,
  ash,
  squall,
  tornado,
  clear,
  clouds,
  unknown
}

class Weather extends Equatable {
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final int created;
  final DateTime lastUpdated;
  final String location;

  const Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  });

  @override
  List<Object> get props => [
        condition,
        formattedCondition,
        minTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location,
      ];

  static Weather fromJson(dynamic json) {
    return Weather(
      condition: _mapStringToWeatherCondition(json['weather'][0]['id'] as int),
      formattedCondition: json['weather'][0]['description'],
      minTemp: json['main']['temp_min'] as double,
      temp: json['main']['temp'] as double,
      maxTemp: json['main']['temp_max'] as double,
      locationId: json['id'] as int,
      created: json['dt'] as int,
      lastUpdated: DateTime.now(),
      location: json['name'],
    );
  }

  static WeatherCondition _mapStringToWeatherCondition(int input) {
    WeatherCondition state;

    switch (input) {
      case 200:
      case 201:
      case 202:
      case 210:
      case 211:
      case 212:
      case 221:
      case 230:
      case 231:
      case 232:
        state = WeatherCondition.thunderstorm;
        break;
      case 300:
      case 301:
      case 302:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 321:
        state = WeatherCondition.drizzle;
        break;
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      case 511:
      case 520:
      case 521:
      case 522:
      case 531:
        state = WeatherCondition.rain;
        break;
      case 600:
      case 601:
      case 602:
      case 611:
      case 612:
      case 613:
      case 615:
      case 616:
      case 620:
      case 621:
      case 622:
        state = WeatherCondition.snow;
        break;
      case 701:
        state = WeatherCondition.mist;
        break;
      case 711:
        state = WeatherCondition.smoke;
        break;
      case 721:
        state = WeatherCondition.haze;
        break;
      case 731:
      case 761:
        state = WeatherCondition.dust;
        break;
      case 741:
        state = WeatherCondition.fog;
        break;
      case 751:
        state = WeatherCondition.sand;
        break;
      case 762:
        state = WeatherCondition.ash;
        break;
      case 771:
        state = WeatherCondition.squall;
        break;
      case 781:
        state = WeatherCondition.tornado;
        break;
      case 800:
        state = WeatherCondition.clear;
        break;
      case 801:
      case 802:
      case 803:
      case 804:
        state = WeatherCondition.clouds;
        break;
      default:
        state = WeatherCondition.unknown;
    }

    return state;
  }
}
