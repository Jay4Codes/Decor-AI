import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:codeshastra/screens/video_player.dart';
// import 'package:trinity/screens/video_player.dart';
// import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  // var _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    List<Widget> reel = [
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/codeshastra-383011.appspot.com/o/Reels%2FWhatsApp%20Video%202023-04-08%20at%2023.13.04.mp4?alt=media&token=cbf02dc2-30d9-44a7-9f54-3973e837cef6"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/codeshastra-383011.appspot.com/o/Reels%2FWhatsApp%20Video%202023-04-08%20at%2023.15.51.mp4?alt=media&token=19ee042c-28c5-4dce-b08e-6ae1178002df"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/codeshastra-383011.appspot.com/o/Reels%2FWhatsApp%20Video%202023-04-08%20at%2023.18.33.mp4?alt=media&token=6a47e4f3-9be9-45e1-9676-4284d60f1a60"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/codeshastra-383011.appspot.com/o/Reels%2FWhatsApp%20Video%202023-04-08%20at%2023.19.42.mp4?alt=media&token=250eaa92-fcee-4e3d-8bbc-ea733e9d82e6"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/codeshastra-383011.appspot.com/o/Reels%2FWhatsApp%20Video%202023-04-08%20at%2023.25.54.mp4?alt=media&token=e2f91e60-aa6d-4fbb-a45e-75aecd72fc3e"),
    ];
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: reel,
    );
  }
}
