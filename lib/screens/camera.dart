import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? cameras;

  void initializeFuntion() async {
    cameras = await availableCameras();
    controller = CameraController(cameras![0], ResolutionPreset.medium);

    _initializeControllerFuture = controller.initialize();
    setState(() {});
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // });
  }

  @override
  void initState() {
    super.initState();
    initializeFuntion();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (!controller.value.isInitialized) {
    //   return Container();
    // }
    return Scaffold(
      body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: 10 / 16,
                child: CameraPreview(controller),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
