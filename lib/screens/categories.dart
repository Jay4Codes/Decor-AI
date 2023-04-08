import 'package:codeshastra/screens/panorama_view.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1a1a),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: GridView.count(
          crossAxisCount: 2,
          physics: BouncingScrollPhysics(),
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/traditional.jpg',
                            placeName: 'Traditional'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/traditional.jpg",
                        height: 132,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Traditional',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/contemporary.jpeg',
                            placeName: 'Contemporary'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/contemporary.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contemporary',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/rustic.jpeg',
                            placeName: 'Rustic'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/rustic.jpeg",
                        height: 132,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rustic',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/bohemian.jpg',
                            placeName: 'Bohemian'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/bohemian.jpg",
                        fit: BoxFit.fill,
                        height: 132,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Bohemian',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/industrial.png',
                            placeName: 'Industrial'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/industrial.png",
                        fit: BoxFit.fill,
                        height: 132,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Industrial',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/coastal.jpg',
                            placeName: 'Coastal'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/coastal.jpg",
                        fit: BoxFit.fill,
                        height: 132,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Coastal',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/mid-century.jpg',
                            placeName: 'Mid-Century'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/mid-century.jpg",
                        height: 132,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mid-century modern',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/farmhouse.jpg',
                            placeName: 'Farmhouse'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/farmhouse.jpg",
                        height: 132,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Farmhouse',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/scandinavian.jpg',
                            placeName: 'Scandinavian'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/scandinavian.jpg",
                        height: 132,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Scandinavian',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PanoramaView(
                            image: 'assets/images/rajhastani.jpg',
                            placeName: 'Rajhastani'))));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF565656).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/rajhastani.jpg",
                        height: 132,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rajhastani',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
