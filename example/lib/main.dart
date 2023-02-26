import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:stream_camera_state/stream_camera_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends StreamCameraState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildCameraPreview(
        previewBuilder: (context, controller) {
          return CameraPreview(controller);
        },
      ),
    );
  }

  @override
  void onCameraControllerInitialized() {
    debugPrint('camera controller initialized');
  }

  @override
  void onCameraImageAvailable(CameraImage cameraImage) {
    debugPrint('image available');
  }
}
