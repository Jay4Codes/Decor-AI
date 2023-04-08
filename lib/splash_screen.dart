import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:codeshastra/auth/login_screen.dart';
import 'package:codeshastra/screens/home_screen.dart';
import 'package:codeshastra/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget getInitialRoute() {
    if (GetStorage().read('token') == null) {
      return LoginScreen();
    }
    return HomeScreen();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(
    //   Duration(seconds: 3),
    //   (() => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: ((context) => getInitialRoute()),
    //         ),
    //       )),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      splashIconSize: 300,
      backgroundColor: kBackgroundColor,
      nextScreen: getInitialRoute(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
