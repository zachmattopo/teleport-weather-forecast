import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:teleport_weather_forecast/apis/apis.dart';
import 'package:teleport_weather_forecast/blocs/weather_bloc.dart';
import 'package:teleport_weather_forecast/simple_bloc_delegate.dart';
import 'package:teleport_weather_forecast/widgets/widgets.dart';
import 'package:bloc/src/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final OpenWeatherApiClient weatherApiClient = OpenWeatherApiClient(
    httpClient: http.Client(),
  );

  BlocOverrides.runZoned(
    () {
      runApp(TeleportWeatherApp(weatherApiClient: weatherApiClient));
    },
    blocObserver: SimpleBlocDelegate(),
  );
}

class TeleportWeatherApp extends StatelessWidget {
  final OpenWeatherApiClient weatherApiClient;

  TeleportWeatherApp({Key key, @required this.weatherApiClient})
      : assert(weatherApiClient != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: 'Teleport Weather Forecast',
      home: BlocProvider(
        create: (context) =>
            WeatherBloc(openWeatherApiClient: weatherApiClient),
        child: WeatherParentWidget(),
      ),
    );
  }
}
