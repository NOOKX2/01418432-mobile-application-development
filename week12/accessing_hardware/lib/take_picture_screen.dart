import 'package:accessing_hardware/display_picture_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget {
  final List<CameraDescription>? camera;

  const TakePictureScreen({super.key, required this.camera});

  @override
  State<StatefulWidget> createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializaControllerFuture;


  Future takePicture() async {
    if (!_controller.value.isInitialized) {
      return null;
    }

    if (_controller.value.isTakingPicture) {
      return null;
    }

    try {
      XFile image = await _controller.takePicture();
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(imagePath: image.path),
        ),
      );
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
     _controller = CameraController(
    widget.camera![0],
    ResolutionPreset.medium,
  );
  
  _initializaControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializaControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      color: Colors.black,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: takePicture,
                            icon: const Icon(Icons.circle, color: Colors.white),
                            iconSize: 50,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
