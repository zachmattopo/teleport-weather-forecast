import 'package:flutter/material.dart';

class CitySelectionWidget extends StatelessWidget {
  const CitySelectionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add_location),
      onPressed: () {
        // TODO: CitySelection page to add new cities
        final snackBar = SnackBar(
          content: Text('This feature is still work in progress!'),
          action: SnackBarAction(
            label: 'Explain',
            onPressed: () {
              showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text("This app is mainly to showcase:"),
                    content: new Text(
                        "1. Fulfilling the basic requirements. ✅\n2. Good code practices and naming conventions. ✅\n3. Exception and edge cases handling. ✅\n4. Creative features. I guess this counts? ✅"),
                  ));
            },
          ),
        );

        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}
