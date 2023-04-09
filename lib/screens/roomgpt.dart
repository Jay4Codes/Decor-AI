import 'dart:convert';
import 'dart:io';

import 'package:codeshastra/utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class RoomGPT extends StatefulWidget {
  const RoomGPT({super.key});

  @override
  State<RoomGPT> createState() => _RoomGPTState();
}

class _RoomGPTState extends State<RoomGPT> {
  File? imageFile;
  String imgUrl = "";
  bool isImageLoaded = false;
  String ogColor = "Red";

  List<String> color = ['Red', 'Yellow', 'Green', 'Orange', 'Black', 'Violet', 'Indigo', 'Blue', 'White'];

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Color _wallColor = Colors.white;
  String hexString = "";

  Future<void> changeWallColor(BuildContext context, String base64, String color) async {
    try {
      String substr = color.substring(2);
      print(substr);
      Loader.show(context, progressIndicator: CircularProgressIndicator(color: Colors.blue));
      final response = await http.post(Uri.parse('http://127.0.0.1:8000/login/ml-model/'),
          body: jsonEncode({
            "image": base64,
            "prompt": "only change wall color to #${ogColor}",
          }));

      print(response.body);
      if (response.statusCode == 200) {
        Loader.hide();
        var body = json.decode(response.body);
        print(body);
        setState(() {
          isImageLoaded = true;
          imgUrl = body["image"][0];
        });
      } else {
        Loader.hide();
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 15, bottom: 15),
                child: Text(
                  "Paint your walls",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              imageFile == null
                  ? Container(
                      margin: EdgeInsets.all(12),
                      child: InkWell(
                        onTap: () {
                          _getFromGallery();
                        },
                        child: DottedBorder(
                          color: Colors.grey,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8),
                          dashPattern: [5, 3],
                          strokeWidth: 1,
                          child: Container(
                            height: 250,
                            // width: MediaQuery.of(context).size.width - 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Flexible(
                                  child: Text(
                                    "Upload Image",
                                    // fileName != null
                                    //     ? fileName!
                                    //     : 'Upload attachment',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // child: imageFile == null
                      //     ? Container(
                      //         alignment: Alignment.center,
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //             TextButton(
                      //               // backcolor: Colors.greenAccent,
                      //               onPressed: () {
                      //                 _getFromGallery();
                      //               },
                      //               child: Text("PICK FROM GALLERY"),
                      //             ),
                      //             Container(
                      //               height: 40.0,
                      //             ),
                      //             TextButton(
                      //               // color: Colors.lightGreenAccent,
                      //               onPressed: () {
                      //                 _getFromCamera();
                      //               },
                      //               child: Text("PICK FROM CAMERA"),
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     : Container(
                      //         child: Image.file(
                      //           imageFile!,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                    )
                  : Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        // borderRadius: BorderRadius.circular(20.0)
                        child: Container(
                          // margin: EdgeInsets.all(8),
                          // padding: EdgeInsets.all(25),
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                          child: Align(
                            alignment: Alignment.center,
                            // widthFactor: 1,
                            heightFactor: 1,
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                      top: 8,
                    ),
                    child: Text(
                      "Choose your colour: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Select wall color'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: _wallColor,
                                onColorChanged: (color) {
                                  setState(() {
                                    _wallColor = color;
                                    hexString = _wallColor.value.toRadixString(16);
                                    print(_wallColor);
                                    print(hexString);
                                  });
                                },
                                pickerAreaHeightPercent: 1,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('CANCEL'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () async {
                                  final bytes = await File(imageFile!.path).readAsBytesSync();
                                  String base64Encode = base64.encode(bytes);
                                  Navigator.of(context).pop();
                                  changeWallColor(context, base64Encode, hexString);
                                  // final file = await _detectWallColor();

                                  // // ignore: use_build_context_synchronously
                                  // Navigator.push(
                                  //     context, MaterialPageRoute(builder: (context) => ImageViewer(image: file!)));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 15),
                      child: Image.asset(
                        "assets/images/color_picker.png",
                        height: 25,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      value: ogColor,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: kPrimaryColor),
                      underline: Container(
                        height: 2,
                        color: kPrimaryColor,
                      ),
                      onChanged: (String? newValue) async {
                        setState(() {
                          ogColor = newValue!;
                        });
                        final bytes = await File(imageFile!.path).readAsBytesSync();
                        String base64Encode = base64.encode(bytes);
                        changeWallColor(context, base64Encode, ogColor);
                      },
                      items: color.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              isImageLoaded
                  ? Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        // borderRadius: BorderRadius.circular(20.0)
                        child: Container(
                          // margin: EdgeInsets.all(8),
                          // padding: EdgeInsets.all(25),
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                          child: Align(
                            alignment: Alignment.center,
                            // widthFactor: 1,
                            heightFactor: 0.7,
                            child: Image.network(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          )),
    );
  }
}
