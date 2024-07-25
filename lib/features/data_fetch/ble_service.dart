import 'dart:convert';
import 'package:flutter_blue/flutter_blue.dart';

class BleService {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? device;
  BluetoothCharacteristic? characteristic;

  final String serviceUUID = "cb0d757a-435f-4615-912c-69b876757d8c";
  final String characteristicUUID = "572b71d9-7c03-4d6a-9044-3c019339d6ee";

  Future<void> connectToDevice() async {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 5));

    // Listen to scan results
    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.name == "ESP32_Kualitas_Air") {
          // Stop scanning
          flutterBlue.stopScan();
          // Connect to the device
          device = r.device;
          device!.connect();
          break;
        }
      }
    });

    // Wait for device to connect
    await Future.delayed(Duration(seconds: 5));

    if (device == null) return;

    // Discover services
    List<BluetoothService> services = await device!.discoverServices();
    for (BluetoothService service in services) {
      if (service.uuid.toString() == serviceUUID) {
        for (BluetoothCharacteristic c in service.characteristics) {
          if (c.uuid.toString() == characteristicUUID) {
            characteristic = c;
            break;
          }
        }
      }
    }
  }

  Future<Map<String, String>> readData() async {
    if (characteristic == null) return {};

    List<int> value = await characteristic!.read();
    String jsonString = String.fromCharCodes(value);

    // Parse JSON string
    Map<String, dynamic> data = jsonDecode(jsonString);

    return {
      "orp": data["orp"].toString(),
      "ph": data["ph"].toString(),
      "turbidity": data["turbidity"].toString(),
      "tds": data["tds"].toString(),
    };
  }
}
