// import 'dart:io';
// import 'dart:math';

// import 'package:codeshastra/screens/image_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:image/image.dart' as img;

// class CameraWidget extends StatefulWidget {
//   CameraWidget();

//   @override
//   _CameraWidgetState createState() => _CameraWidgetState();
// }

// class _CameraWidgetState extends State<CameraWidget> {
//   late CameraController _controller;
//   Future<void>? _initializeControllerFuture;
//   Color _wallColor = Colors.white;
//   List<CameraDescription>? cameras;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   initializeCamera() async {
//     cameras = await availableCameras();
//     _controller = CameraController(
//       cameras![0],
//       ResolutionPreset.medium,
//     );
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<File?> _captureImage() async {
//     try {
//       await _initializeControllerFuture;

//       final image = await _controller.takePicture();

//       return File(image.path);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   double _colorDistance(Color color1, Color color2) {
//     final r1 = color1.red;
//     final g1 = color1.green;
//     final b1 = color1.blue;
//     final r2 = color2.red;
//     final g2 = color2.green;
//     final b2 = color2.blue;
//     return sqrt(pow(r1 - r2, 2) + pow(g1 - g2, 2) + pow(b1 - b2, 2));
//   }

//   Future<File?> _detectWallColor() async {
//     File? imageFile;
//     try {
//       await _initializeControllerFuture;

//       final i = await _controller.takePicture();

//       imageFile = File(i.path);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//     // Load the image from the file.
//     final image = img.decodeImage(imageFile.readAsBytesSync());

//     // Count the number of pixels of each color that are similar to the wall color.
//     final colorCounts = Map<int, int>();
//     for (var x = 0; x < image!.width; x++) {
//       for (var y = 0; y < image.height; y++) {
//         final pixel = image.getPixel(x, y);
//         final Color color = Color.fromARGB(
//             pixel., pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt());
//         final distance = _colorDistance(color, _wallColor);
//         if (distance < 50) {
//           // Threshold for similarity.
//           colorCounts[color.value] = (colorCounts[color.value] ?? 0) + 1;
//         }
//       }
//     }

//     // Find the most common color that is similar to the wall color.
//     var maxCount = 0;
//     var wallColor = _wallColor;
//     colorCounts.forEach((color, count) {
//       if (count > maxCount) {
//         maxCount = count;
//         wallColor = Color(color);
//       }
//     });

//     // Change the color of the walls to the most common color.
//     for (var x = 0; x < image.width; x++) {
//       for (var y = 0; y < image.height; y++) {
//         final pixel = image.getPixel(x, y);
//         final color = Color.fromARGB(
//             pixel.a.toInt(), pixel.r.toInt(), pixel.g.toInt(), pixel.b.toInt());
//         final distance = _colorDistance(color, _wallColor);
//         if (distance < 50) {
//           // Threshold for similarity.
//           image.setPixel(
//               x,
//               y,
//               img.ColorFloat16.rgba(_wallColor.red, _wallColor.green,
//                   _wallColor.blue, _wallColor.alpha));
//         }
//       }
//     }

//     // Save the modified image to a new file.
//     final newImageFile = File('${imageFile.path}_new.jpg');
//     newImageFile.writeAsBytesSync(img.encodeJpg(image));
//     return newImageFile;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: const Text('Select wall color'),
//                       content: SingleChildScrollView(
//                         child: ColorPicker(
//                           pickerColor: _wallColor,
//                           onColorChanged: (color) {
//                             setState(() {
//                               _wallColor = color;
//                             });
//                           },
//                           pickerAreaHeightPercent: 1,
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: const Text('CANCEL'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         TextButton(
//                           child: const Text('OK'),
//                           onPressed: () async {
//                             final file = await _detectWallColor();
//                             Navigator.of(context).pop();
//                             // ignore: use_build_context_synchronously
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ImageViewer(image: file!)));
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: CameraPreview(_controller),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
