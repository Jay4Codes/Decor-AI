import 'package:codeshastra/screens/categories.dart';
import 'package:codeshastra/screens/camera.dart';
import 'package:codeshastra/screens/lens.dart';
import 'package:codeshastra/screens/marketplace.dart';
import 'package:codeshastra/screens/roomgpt.dart';
import 'package:codeshastra/screens/video_player.dart';
import 'package:codeshastra/screens/videos.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:codeshastra/utils/constants.dart';
// import 'package:video_player/video_player.dart';

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
    if (activeIndex == 0) return RoomGPT();
    if (activeIndex == 1) return Videos();
    if (activeIndex == 2) return MarketPlace();
    // return MapScreen(
    //   latitude: latitude!,
    //   longitude: longitude!,
    // );
    if (activeIndex == 3) return Categories();

    return ObjectLens();
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
              Icons.color_lens,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.video_call,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.moneyBill,
              size: 22,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.panorama,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.chair,
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
