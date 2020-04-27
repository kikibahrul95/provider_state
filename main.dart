# provider_state
flutter

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/aplicationcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Aplicationcolor>(
        builder: (context) => Aplicationcolor (),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<Aplicationcolor>(
              builder: (context, aplicationcolor, _) => Text(
                "provider state",
                style: TextStyle(color: aplicationcolor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<Aplicationcolor>(
                  builder: (context, aplicationcolor, _) => AnimatedContainer(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      color: Colors.lightBlue,
                      duration: Duration(milliseconds: 500)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(margin: EdgeInsets.all(5), child: Text("AB")),
                    Consumer<Aplicationcolor>(
                        builder: (context, aplicationcolor, _) => Switch(
                            value: aplicationcolor.isLightBlue,
                            onChanged: (newValue) {
                              aplicationcolor.isLightBlue = newValue;
                            })),
                    Container(margin: EdgeInsets.all(5), child: Text("LB"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

