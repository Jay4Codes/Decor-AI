import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  ImageViewer({required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Image.file(image),
      ),
    );
  }
}
