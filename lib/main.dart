import 'package:bloc/bloc.dart';
import 'package:carsome_weather/apis/apis.dart';
import 'package:carsome_weather/blocs/weather_bloc.dart';
import 'package:carsome_weather/main_bloc_delegate.dart';
import 'package:carsome_weather/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  BlocSupervisor.delegate = MainBlocDelegate();

  final OpenWeatherApiClient weatherApiClient = OpenWeatherApiClient(
    httpClient: http.Client(),
  );

  runApp(CarsomeWeatherApp(weatherApiClient: weatherApiClient));
}

class CarsomeWeatherApp extends StatelessWidget {
  final OpenWeatherApiClient weatherApiClient;

  CarsomeWeatherApp({Key key, @required this.weatherApiClient})
      : assert(weatherApiClient != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      title: 'Carsome Weather',
      home: BlocProvider(
        create: (context) =>
            WeatherBloc(openWeatherApiClient: weatherApiClient),
        child: WeatherParentWidget(),
      ),
    );
  }
}
