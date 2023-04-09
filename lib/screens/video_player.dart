import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:codeshastra/main.dart';
import 'package:codeshastra/utils/constants.dart';
// import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoScreen extends StatefulWidget {
  final String url;
  const VideoScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late CachedVideoPlayerController controller;

  void initController() async {
    controller = CachedVideoPlayerController.network(widget.url);
    await controller.initialize();
    controller.play();
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    // if (controller.value.isInitialized) {
    //   return const CircularProgressIndicator();
    // }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: () {
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
        child: SizedBox(
          height: double.infinity,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CachedVideoPlayer(controller),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   elevation: 1,
          //   backgroundColor: Colors.transparent,
          //   onPressed: () {
          //     // Share.share(widget.url);
          //     // Future.delayed(Duration(seconds: 2), () {
          //     //   flutterLocalNotificationsPlugin.show(
          //     //       1,
          //     //       "SSR's murderer found",
          //     //       "Politician on the run after warrant declared against his name.Fans ask for his head",
          //     //       NotificationDetails(
          //     //           android: AndroidNotificationDetails(
          //     //         channel.id,
          //     //         channel.name,
          //     //         channelDescription: channel.description,
          //     //         sound: channel.sound,
          //     //       )));
          //     //   // setState(() {
          //     //   //   newNews = true;
          //     //   // });
          //     // });
          //   },
          //   child: Icon(
          //     Icons.add,
          //     color: Colors.white,
          //     size: 30,
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          FloatingActionButton(
            elevation: 1,
            backgroundColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (color == Colors.white) {
                  color = Colors.red;
                } else {
                  color = Colors.white;
                }
              });
            },
            child: Icon(
              Icons.favorite,
              color: color,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            elevation: 1,
            backgroundColor: Colors.transparent,
            onPressed: () {
              Share.share(widget.url);
            },
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
