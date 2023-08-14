```dart
  Future<bool> isBluetoothEnabled() async {
    await FlutterBluePlus.instance.isOn;
    await Future.delayed(Duration(milliseconds: 100));
    final state = await FlutterBluePlus.instance.state.first;
    if (state == BluetoothState.on)
      return true;
    else 
      return false;
  }

  Future<bool> turnOnBluetooth() async {
    if (Platform.isAndroid) {
      return await FlutterBluePlus.instance.turnOn();
    }
    return true;
  }

  Future<bool> turnOffBluetooth() async {
    if (Platform.isAndroid) {
      return await FlutterBluePlus.instance.turnOff();
    }

    return true;
  }

  Future<List<BTDeviceStructure>> findDevices() async {
    final flutterBlue = FlutterBluePlus.instance;

    List<BTDeviceStructure> devices = [];

    flutterBlue.scanResults.listen((List<ScanResult> results) {
      List<ScanResult> scannedDevices = [];
      for (ScanResult r in results) {
        if ( r.device.name.isNotEmpty) {
          scannedDevices.add(r);;
        }
      }

      scannedDevices.sort((a,b) => b.rssi.compareTo(a.rssi));
      devices.clear();
      scannedDevices.forEach((deviceResult) { 
        devices.add(BTDeviceStructure(
          deviceResult.device.name,
          deviceResult.device.id.toString(),
          deviceResult.rssi,
        ));
      });
    });
    final isScanning = flutterBlue.isScanningNow;
    if (!isScanning) {
      await flutterBlue.startScan(
        timeout: const Duration(seconds: 5),
      );
    }


    return devices;
  }


  Future<List<BTDeviceStructure>> getConnectedDevices() async {
    final flutterBlue = FlutterBluePlus.instance;
    final connectedDevices = await flutterBlue.connectedDevices;

    List<BTDeviceStructure> devices = [];

    for (int i = 0; i < connectedDevices.length; i++) {
      final deviceResult = connectedDevices[i];
      final deviceState = await deviceResult.state.first;
      if (deviceState == BluetoothDeviceState.connected) {
        final deviceRssi = await deviceResult.readRssi();
        devices.add(BTDeviceStructure(
          deviceResult.name,
          deviceResult.id.toString(),
          deviceRssi,
        ));
      }
    }
    return devices;
  }


  Future<List<BTDeviceStructure>> getConnectedDevice() async {
    final flutterBlue = FlutterBluePlus.instance;
    final connectedDevices = await flutterBlue.connectedDevices;
    List<BTDeviceStructure> devices = [];

    for ( int i=0; i<connectedDevices.length; i++) {
      final deviceResult = connectedDevices[i];
      final deviceState = await deviceResult.state.first;
      if ( deviceState == BluetoothDeviceState.connected) {
        final deviceRssi = await deviceResult.readRssi();
        devices.add(BTDeviceStructure(
          deviceResult.name, 
          deviceResult.id.toString(), deviceRssi));
      }
    }

    return devices;
  }

  Future<bool> connectDevice(BTDeviceStructure deviceInfo) async {
    final device = BluetoothDevice.fromId('deviceInfo.id', name: deviceInfo.name);
    try {
      await device.connect();
    } catch (e) {
      print(e);
    }
    var hasWriteCharacteristic = false;
    final services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isWrite = characteristic.properties.write;
        if (isWrite) {
          debugPrint(
              'Found write characteristic: ${characteristic.uuid}, ${characteristic.properties}');
          hasWriteCharacteristic = true;
        }
      }
    }
    return hasWriteCharacteristic;
  }


  Future disconnectDevice(BTDeviceStructure deviceInfo) async {
    final device = BluetoothDevice.fromId('deviceInfo.id', name: deviceInfo.name);
    try {
      await device.disconnect();
    } catch (e) {
      print(e);
    }
  }

  Future<int> getRssi(BTDeviceStructure deviceInfo) async {
    final device = BluetoothDevice.fromId('id', name: deviceInfo.name);

    return await device.readRssi();
  }


  Future sendData(BTDeviceStructure deviceInfo, String data) async {
    final device = BluetoothDevice.fromId('deviceInfo.id', name: deviceInfo.name);
    final services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isWrite = characteristic.properties.write;
        if (isWrite) {
          await characteristic.write(data.codeUnits);
        }
      }
    }
  }

  Future<String?> receiveData(BTDeviceStructure deviceInfo) async {
    final device = BluetoothDevice.fromId('deviceInfo.id', name: deviceInfo.name);
    final services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isRead = characteristic.properties.read;
        final isNotify = characteristic.properties.notify;
        if (isRead && isNotify) {
          final value = await characteristic.read();
          return String.fromCharCodes(value);
        }
      }
    }
    return null;
  }
```