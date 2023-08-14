```dart
// main.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream _myStream =
      Stream.periodic(const Duration(seconds: 1), (int count) {
    return count;
  });

  // The subscription on events from _myStream
  late StreamSubscription _sub;

  // This number will be displayed in the center of the screen
  // It changes over time
  int _computationCount = 0;

  // Background color
  // In the beginning, it's indigo but it will be a random color later
  Color _bgColor = Colors.indigo;

  @override
  void initState() {
    _sub = _myStream.listen((event) {
      setState(() {
        _computationCount = event;

        // Set the background color to a random color
        _bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: const Text('KindaCode.com'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(
          _computationCount.toString(),
          style: const TextStyle(fontSize: 150, color: Colors.white),
        ),
      ),
      // This button is used to unsubscribe the stream listener
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.stop,
          size: 30,
        ),
        onPressed: () => _sub.cancel(),
      ),
    );
  }

  // Cancel the stream listener on dispose
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
```

## 주요 Point

> declare stream

```dart
  final Stream _myStream =
      Stream.periodic(const Duration(seconds: 1), (int count) {
    return count;
  });
```

<br>


> declare subscription 

```dart
  late StreamSubscription _sub;
```

<br>

> initialize
```dart
  @override
  void initState() {
    _sub = _myStream.listen((event) {
      setState(() {
        _computationCount = event;

        // Set the background color to a random color
        _bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    });
    super.initState();
  }
```

<br>

> Use event variable

```dart
      body: Center(
        child: Text(
          _computationCount.toString(),
          style: const TextStyle(fontSize: 150, color: Colors.white),
        ),
      ),
```

> dispose use event handler

```dart
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
```