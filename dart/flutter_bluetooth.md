> AndroidManifest.xml

```xml
    <!-- Allow Bluetooth -->
    <uses-feature
        android:name="android.hardware.bluetooth_le"
        android:required="true" />
    <!-- Request legacy Bluetooth permissions on older devices. -->
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
    <!-- Needed only if your app looks for Bluetooth devices.
        If your app doesn't use Bluetooth scan results to derive physical
        location information, you can strongly assert that your app
        doesn't derive physical location. -->
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
    <!-- Needed only if your app makes the device discoverable to Bluetooth devices. -->
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
    <!-- Needed only if your app communicates with already-paired Bluetooth devices. -->
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <!-- If your application supports a service and can run on Android 10 (API level 29) or Android 11, you must also declare 
    the ACCESS_BACKGROUND_LOCATION permission to discover Bluetooth devices. -->
    <!-- <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" /> -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```


> Load test

