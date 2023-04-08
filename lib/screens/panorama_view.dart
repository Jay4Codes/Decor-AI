import 'package:codeshastra/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:panorama/panorama.dart';

class PanoramaView extends StatefulWidget {
  PanoramaView({super.key, required this.image, required this.placeName});

  final String image;
  String placeName;

  @override
  State<PanoramaView> createState() => _PanoramaViewState();
}

class _PanoramaViewState extends State<PanoramaView> {
  Map<String, String> imageMap = {
    'Traditional': 'assets/images/traditional.jpg',
    'Contemporary': 'assets/images/contemporary.jpeg',
    'Rustic': 'assets/images/rustic.jpeg',
    'Bohemian': 'assets/images/bohemian.jpg',
    'Industrial': 'assets/images/industrial.png',
    'Coastal': 'assets/images/coastal.jpg',
    'Mid-Century': 'assets/images/mid-century.jpg',
    'Farmhouse': 'assets/images/farmhouse.jpg',
    'Scandinavian': 'assets/images/scandinavian.jpg',
    'Rajhastani': 'assets/images/rajhastani.jpg'
  };

  List<String> decors = [
    'Traditional',
    'Contemporary',
    'Rustic',
    'Bohemian',
    'Industrial',
    'Coastal',
    'Mid-Century',
    'Farmhouse',
    'Scandinavian',
    'Rajhastani',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Panorama(
              child: Image.asset(imageMap[widget.placeName]!),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: DropdownButton<String>(
              value: widget.placeName,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: kPrimaryColor),
              underline: Container(
                height: 2,
                color: kPrimaryColor,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  widget.placeName = newValue!;
                });
              },
              items: decors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
