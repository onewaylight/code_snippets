```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// App Widget
class MyApp extends StatefulWidget {
  /// Initialize app
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Home
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            "Elevated Buttons",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Rounded Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.purple),
                    child: Text(
                      "ROUNDED",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  // Spacing
                  Container(height: 20.0),

                  // Bevelled Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.deepPurple),
                    child: Text(
                      "BEVELLED",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  // Spacing
                  Container(height: 20.0),

                  // Pill shaped
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      primary: Colors.deepPurpleAccent,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "PILL SHAPED",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  // Spacing
                  Container(height: 20.0),

                  // Using clipper
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        primary: Colors.green,
                      ),
                      child: Text(
                        "USING CLIPPER",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ])));
  }
}
```