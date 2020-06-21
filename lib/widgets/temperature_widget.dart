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
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Text(
              'Max: ${maxTemp.toStringAsFixed(1)} °C',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Min: ${minTemp.toStringAsFixed(1)} °C',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ],
    );
  }
}