import 'package:codeshastra/screens/categories.dart';
import 'package:codeshastra/screens/marketplace.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:codeshastra/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? activeIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeIndex = 0;
    });
    // initializeLocation();
  }

  Widget getTab() {
    if (activeIndex == 0) return Container();
    if (activeIndex == 1) return Container();
    if (activeIndex == 2) return MarketPlace();
    // return MapScreen(
    //   latitude: latitude!,
    //   longitude: longitude!,
    // );
    if (activeIndex == 3) return Categories();

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: kPrimaryColor,
          backgroundColor: kBackgroundColor,
          items: const [
            Icon(
              Icons.home,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.video_call,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.earthAfrica,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.account_box,
              size: 24,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        body: Container(
          child: getTab(),
        ));
  }
}
