// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';

// class ObjectLens extends StatefulWidget {
//   const ObjectLens({super.key});

//   @override
//   State<ObjectLens> createState() => _ObjectLensState();
// }

// class _ObjectLensState extends State<ObjectLens> {
//   void useLens() async {
//     final ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler(
//       ImageLabelerOptions(confidenceThreshold: 0.7),
//     );

//     final inputImage = InputImage.fromFilePath(imageFile!.path);
//     final imageLabels = await imageLabeler.processImage(inputImage);

//     // imageLabels.
//     final ObjectDetectorOptions options = ObjectDetectorOptions(
//       mode: DetectionMode.single,
//       classifyObjects: true,
//       multipleObjects: true,
//     );

//     final ObjectDetector objectDetector = GoogleMlKit.vision.objectDetector(options: options);
// final objectLabels = await objectDetector.processImage(inputImage);

// for (final label in imageLabels) {
//   print('Label: ${label.label}, Confidence: ${label.confidence}');
// }

//     final Paint greenBoxPaint = Paint()
//       ..style = PaintingStyle.stroke
//       ..color = Colors.green
//       ..strokeWidth = 2.0;

//     final List<Rect> boundingBoxes = [];
//     Canvas? canvas;

//     for (final object in objectLabels) {
//       boundingBoxes.add(object.boundingBox);

//       // Draw a green bounding box around the detected object.
//       canvas!.drawRect(object.boundingBox, greenBoxPaint);
//     }

//     setState(() {
//       isImageLoaded = true;
//     });

//     // inputImage.filePath!
//   }

//   File? imageFile;
//   String imgUrl = "";
//   bool isImageLoaded = false;

//   _getFromGallery() async {
//     XFile? pickedFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//     useLens();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             imageFile == null
//                 ? Container(
//                     margin: EdgeInsets.all(12),
//                     child: InkWell(
//                       onTap: () {
//                         _getFromGallery();
//                       },
//                       child: DottedBorder(
//                         color: Colors.grey,
//                         borderType: BorderType.RRect,
//                         radius: Radius.circular(8),
//                         dashPattern: [5, 3],
//                         strokeWidth: 1,
//                         child: Container(
//                           height: 250,
//                           // width: MediaQuery.of(context).size.width - 60,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Flexible(
//                                 child: Text(
//                                   "Upload Image",
//                                   // fileName != null
//                                   //     ? fileName!
//                                   //     : 'Upload attachment',
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // child: imageFile == null
//                     //     ? Container(
//                     //         alignment: Alignment.center,
//                     //         child: Column(
//                     //           mainAxisAlignment: MainAxisAlignment.center,
//                     //           children: <Widget>[
//                     //             TextButton(
//                     //               // backcolor: Colors.greenAccent,
//                     //               onPressed: () {
//                     //                 _getFromGallery();
//                     //               },
//                     //               child: Text("PICK FROM GALLERY"),
//                     //             ),
//                     //             Container(
//                     //               height: 40.0,
//                     //             ),
//                     //             TextButton(
//                     //               // color: Colors.lightGreenAccent,
//                     //               onPressed: () {
//                     //                 _getFromCamera();
//                     //               },
//                     //               child: Text("PICK FROM CAMERA"),
//                     //             )
//                     //           ],
//                     //         ),
//                     //       )
//                     //     : Container(
//                     //         child: Image.file(
//                     //           imageFile!,
//                     //           fit: BoxFit.cover,
//                     //         ),
//                     //       ),
//                   )
//                 : Container(
//                     margin: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0),
//                       // borderRadius: BorderRadius.circular(20.0)
//                       child: Container(
//                         // margin: EdgeInsets.all(8),
//                         // padding: EdgeInsets.all(25),
//                         width: MediaQuery.of(context).size.width,
//                         // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//                         child: Align(
//                           alignment: Alignment.center,
//                           // widthFactor: 1,
//                           heightFactor: 1,
//                           child: Image.file(
//                             imageFile!,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//             isImageLoaded
//                 ? Container(
//                     child: Image.asset(imageFile!.path),
//                   )
//                 : Container()
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';

// class ObjectLens extends StatefulWidget {
//   @override
//   State<ObjectLens> createState() => _ObjectLensState();
// }

// class _ObjectLensState extends State<ObjectLens> {

//   File? imageFile;
//   List<DetectedObject> _detectedObjects = [];

//   ui.Image? imageWithBox;

//   // Future<void> convertFileToImage(File picture) async {
//   //   List<int> imageBase64 = picture.readAsBytesSync();
//   //   String imageAsString = base64Encode(imageBase64);
//   //   Uint8List uint8list = base64.decode(imageAsString);
//   //   ui.Image image = Image.memory()
//   //   setState(() {
//   //     imageWithBox=image;
//   //   });
//   // }

//   //   _getFromGallery() async {
//   //   XFile? pickedFile = await ImagePicker().pickImage(
//   //     source: ImageSource.gallery,
//   //     maxWidth: 1800,
//   //     maxHeight: 1800,
//   //   );
//   //   if (pickedFile != null) {
//   //     setState(() {
//   //       imageFile = File(pickedFile.path);
//   //     });
//   //   }
//   //   // useLens();
//   // }

//     Future<void> _getImage() async {
//     final pickedFile = await _picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final imageBytes = File(pickedFile.path).readAsBytesSync();
//       final path = pickedFile.path;
//       final image = await decodeImageFromList(imageBytes);
//       setState(() {
//         imageWithBox = image;
//         _detectedObjects = [];
//       });
//       _detectObjects(image, path);
//     }
//   }
//     // if (pickedFile != null) {
//     //   final imageBytes = File(pickedFile.path).readAsBytesSync();
//     //   final image = await decodeImageFromList(imageBytes);
//     //   setState(() {
//     //     _image = image;
//     //     _detectedObjects = [];
//     //   });
//     //   _detectObjects(image);
//     // }
//   }

//   // Future<void> _detectObjects(ui.Image image) async {
//   //   final inputImage = FirebaseVisionImage.fromBytes(Uint8List.fromList(await image.toByteData(format: ui.ImageByteFormat.png)!.buffer.asUint8List()), FirebaseVisionImageMetadata(
//   //     size: Size(image.width.toDouble(), image.height.toDouble()),
//   //     rawFormat: image.format.raw,
//   //     rotation: ImageRotation.rotation0,
//   //     planeData: [],
//   //   ));

//   //   final objects = await _objectDetector.processImage(inputImage);

//   //   setState(() {
//   //     _detectedObjects = objects;
//   //   });
//   // }

//   Future<void> _detectObjects(ui.Image image, String path) async {
//      final ObjectDetectorOptions _options = ObjectDetectorOptions(
//       mode: DetectionMode.single,
//       classifyObjects: true,
//       multipleObjects: true,
//     );
//     final ImagePicker _picker = ImagePicker();
//     final ObjectDetector _objectDetector = GoogleMlKit.vision.objectDetector(options:_options );
//     final inputImage = InputImage.fromFilePath(path);
//     final objects = await _objectDetector.processImage(inputImage);

//     setState(() {
//       _detectedObjects = objects;

//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Object Detection'),
//       ),
//       body: Center(
//         child:   == null
//             ? Text('No image selected.')
//             : CustomPaint(
//                 painter: ObjectPainter(imageWithBox!, _detectedObjects),
//                 child: Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                 ),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _getImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class ObjectPainter extends CustomPainter {
//   final ui.Image image;
//   final List<DetectedObject> objects;

//   ObjectPainter(this.image, this.objects);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2
//       ..color = Colors.green;

//     canvas.drawImage(image, Offset.zero, paint);

//     for (var object in objects) {
//       canvas.drawRect(
//         object.boundingBox,
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(ObjectPainter oldDelegate) {
//     return true;
//   }
// }

import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:codeshastra/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class ObjectLens extends StatefulWidget {
  @override
  State<ObjectLens> createState() => _ObjectLensState();
}

class _ObjectLensState extends State<ObjectLens> {
  ui.Image? _image;
  final ImagePicker _picker = ImagePicker();
  List<DetectedObject> _detectedObjects = [];
  final ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler(
    ImageLabelerOptions(confidenceThreshold: 0.8),
  );

  List labelName = [];
  List confidence = [];
  List price = [];
  int total = 0;

  Future<void> _getImage() async {
    labelName.clear();
    confidence.clear();
    price.clear();
    setState(() {
      total = 0;
    });
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = File(pickedFile.path).readAsBytesSync();
      final image = await decodeImageFromList(imageBytes);
      final String path = pickedFile.path;
      setState(() {
        _image = image;
        _detectedObjects = [];
      });
      _detectObjects(image, path);
    }
  }

  Future<void> _detectObjects(ui.Image image, String path) async {
    final ObjectDetectorOptions options = ObjectDetectorOptions(
      mode: DetectionMode.single,
      classifyObjects: true,
      multipleObjects: true,
    );

    int next(int min, int max) {
      final _random = new Random();
      return min + _random.nextInt(max - min);
    }

    final ObjectDetector _objectDetector = GoogleMlKit.vision.objectDetector(options: options);

    final inputImage = InputImage.fromFilePath(path);
    final imageLabels = await imageLabeler.processImage(inputImage);
    // final objectLabels = await _objectDetector.processImage(inputImage);
    for (final label in imageLabels) {
      print('Label: ${label.label}, Confidence: ${label.confidence}');
      labelName.add(label.label);
      confidence.add(label.confidence);
      price.add(next(500, 1500));
    }
    for (final int p in price) {
      total = total + p;
    }

    final objects = await _objectDetector.processImage(inputImage);

    setState(() {
      _detectedObjects = objects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Furniture Detection'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _image == null
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150.0, left: 50),
                        child: Image.asset('assets/images/empty_state.png'),
                      ),
                      InkWell(
                        onTap: _getImage,
                        child: Text(
                          "Choose your image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                : FittedBox(
                    fit: BoxFit.contain,
                    child: CustomPaint(
                      size: Size.fromWidth(
                        _image!.width.toDouble(),
                      ),
                      painter: ObjectPainter(_image!, _detectedObjects),
                      child: Container(
                        width: _image!.width.toDouble(),
                        height: _image!.height.toDouble(),
                      ),
                    ),
                  ),
            _image != null
                ? ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: labelName.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    labelName[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Confidence: ${confidence[index]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Text(
                                    "Rs. ${price[index].toString()} - ${(price[index] + 500).toString()}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                )
                              ],
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15),
                            child: Text(
                              "Total: ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
                            child: Text(
                              "Rs.  ${total.toString()} - ${(total + 500).toString()}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: InkWell(
                          onTap: _getImage,
                          child: Text(
                            "Choose your image",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(

      //   tooltip: 'Pick Image',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class ObjectPainter extends CustomPainter {
  final ui.Image image;
  final List<DetectedObject> objects;

  ObjectPainter(this.image, this.objects);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..color = Colors.green;

    canvas.drawImage(image, Offset.zero, paint);

    for (var object in objects) {
      canvas.drawRect(
        object.boundingBox,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ObjectPainter oldDelegate) {
    return true;
  }
}
