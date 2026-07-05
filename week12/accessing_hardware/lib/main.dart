import 'dart:async';

import 'package:accessing_hardware/take_picture_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  for (var camera in cameras) {
    print('Camera: ${camera.name}, Direction: ${camera.lensDirection}');
  }

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: cameras),
    ),
  );
}
