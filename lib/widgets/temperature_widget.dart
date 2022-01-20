import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    Key key,
    @required this.temp,
    @required this.maxTemp,
    @required this.minTemp,
  }) : super(key: key);

  final num temp;
  final num maxTemp;
  final num minTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${temp.toStringAsFixed(1)} °C',
          style: Theme.of(context).textTheme.headline3.copyWith(
                color: Colors.black,
              ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                'Max: ${maxTemp.toStringAsFixed(1)} °C',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.orange,
                    ),
              ),
              Text(
                'Min: ${minTemp.toStringAsFixed(1)} °C',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.lightBlue,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
