import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late GyroscopeEvent gyroEvent;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen(
          (GyroscopeEvent event) {
        print(event);
        setState(() {
          gyroEvent = event;
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(child: ListTile(leading: const Text("Gyroscope"), trailing: Text("X: ${gyroEvent.x}, Y: ${gyroEvent.y}, Z: ${gyroEvent.z}"),))
        ],
      ),
    );
  }
}
