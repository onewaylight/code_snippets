/*
 *  pubspec.yaml
 *    - flutter_blue_plus: ^1.12.9
 *    - permission_handler: ^10.2.0
 * Addd Bluetooth Permision in AndroidManifest.xml
 */

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';


final snackBarKeyA = GlobalKey<ScaffoldMessengerState>();

void main() {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request().then((status) {
      runApp(const MyApp());
    });
  } else {
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.lightBlue,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<BluetoothAdapterState>(
        stream: FlutterBluePlus.adapterState,
        initialData: BluetoothAdapterState.unknown,
        builder: (c, snapshot) {
          final adapterState = snapshot.data;
          if ( adapterState == BluetoothAdapterState.on) {
            return const MyHomePage(title: 'Demo App');
          } else {
            FlutterBluePlus.stopScan();
            return BluetoothOffScreen(adapterState: adapterState);
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.adapterState}) : super(key: key);

  final BluetoothAdapterState? adapterState;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: snackBarKeyA,
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.bluetooth_disabled,
                size: 200.0,
                color: Colors.white54,
              ),
              Text(
                'Bluetooth Adapter is ${adapterState != null ? adapterState.toString().split(".").last : 'not available'}.',
                style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(color: Colors.white),
              ),
              if (Platform.isAndroid)
                ElevatedButton(
                  child: const Text('TURN ON'),
                  onPressed: () async {
                    try {
                      if (Platform.isAndroid) {
                        await FlutterBluePlus.turnOn();
                      }
                    } catch (e) {
                      final snackBar = SnackBar(content: Text(prettyException("Error Turning On:", e)));
                      snackBarKeyA.currentState?.showSnackBar(snackBar);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// BluetoothDevice findDevices() async {

//   //List<BTDeviceStructure> devices = [];
//   FlutterBluePlus.scanResults.listen((scanResult) { 
//     for ( ScanResult r in scanResult) {
//       if ( r.device.localName == 'MyDevice') {

//         r.device.connect(timeout: Duration(seconds: 4)).catchError((e) {});

//         return r.device;
//       }
//     }
//   });
// }  


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  final Stream<int> stream =
      Stream.periodic(Duration(seconds: 1), (int count) {
        print('Periodic Processing $count');

        return count;
      });
//  final StreamController<int> _streamController = StreamController();

  Future<void> startScan () async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
  }


  @override
  void initState() {
    super.initState();

    connectionString = "Start Scaning";

    startScan();
    // if ( FlutterBluePlus.isScanningNow == false) {
    //   print('initState : $connectionString');
    //FlutterBluePlus.startScan(timeout: const Duration(seconds: 15), androidUsesFineLocation: false);
    // }
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String connectionString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10,),
            Text(
              '$connectionString',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10,),
            if (Platform.isAndroid)
                ElevatedButton(
                  child: const Text('Start Scan'),
                  onPressed: () async {
                    try {
                      if (Platform.isAndroid) {
                        print('Start Scan BLE Device');
                        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
                      }
                    } catch (e) {
                      final snackBar = SnackBar(content: Text(prettyException("Error Turning On:", e)));
                      snackBarKeyA.currentState?.showSnackBar(snackBar);
                    }
                  },
                ),
            SizedBox(height:20,),
            StreamBuilder<int>(
              stream: stream, 
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if ( snapshot.hasData)
                  return Text('${snapshot.data}');
                else
                  return Text('No Data');
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


String prettyException(String prefix, dynamic e) {
  if (e is FlutterBluePlusException) {
    return "$prefix ${e.errorString}";
  } else if (e is PlatformException) {
    return "$prefix ${e.message}";
  }
  return prefix + e.toString();
}