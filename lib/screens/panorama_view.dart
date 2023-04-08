import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:panorama/panorama.dart';

class PanoramaView extends StatefulWidget {
  const PanoramaView({super.key, required this.image, required this.placeName});

  final String image;
  final String placeName;

  @override
  State<PanoramaView> createState() => _PanoramaViewState();
}

class _PanoramaViewState extends State<PanoramaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Panorama(
        child: Image.asset(widget.image),
    ),
);}
}