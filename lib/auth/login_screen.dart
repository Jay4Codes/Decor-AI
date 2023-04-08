import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:ionicons/ionicons.dart';
import 'package:codeshastra/animations/change_screen_animation.dart';
import 'package:codeshastra/auth/auth_controller.dart';
import 'package:codeshastra/components/bottom_text.dart';
// import 'package:codeshastra/components/center_widget/center_widget.dart';
// import 'package:codeshastra/components/login_content.dart';
import 'package:codeshastra/components/top_text.dart';
import 'package:codeshastra/screens/home_screen.dart';
import 'package:codeshastra/utils/constants.dart';
import 'package:codeshastra/utils/helper_functions.dart';

// import 'components/center_widget/center_widget.dart';
// import 'components/login_content.dart';
enum Screens {
  createAccount,
  welcomeBack,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  AuthController controller = AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget inputField(String hint, IconData iconData,
      [bool obscureText = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: const GradientBoxBorder(
                width: 2,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.repeated,
                  colors: [
                    Color.fromRGBO(189, 105, 255, 1),
                    Color.fromRGBO(255, 255, 255, 0),
                  ],
                ),
              ),
            ),
            child: TextField(
              controller:
                  hint == "Email" ? emailController : passwordController,
              obscureText: obscureText,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xff1a1a1a),
                hintText: hint,
                hintStyle: TextStyle(color: kPrimaryColor),
                prefixIcon: Icon(
                  iconData,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () async {
          Loader.show(context,
              progressIndicator: CircularProgressIndicator(color: Colors.blue));
          String status = '';

          try {
            status = await controller.login(
                emailController.text, passwordController.text);
          } on Exception catch (e) {
            Loader.hide();
          }
          Loader.hide();

          if (status == "Success") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => HomeScreen())));
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          primary: kPrimaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/facebook.png'),
          const SizedBox(width: 24),
          Image.asset('assets/images/google.png'),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  // Widget topWidget(double screenWidth) {
  //   return Transform.rotate(
  //     angle: -35 * math.pi / 180,
  //     child: Container(
  //       width: 1.2 * screenWidth,
  //       height: 1.2 * screenWidth,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(150),
  //         gradient: const LinearGradient(
  //           begin: Alignment(-0.2, -0.8),
  //           end: Alignment.bottomCenter,
  //           colors: [
  //             Color(0x007CBFCF),
  //             Color(0xB316BFC4),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget bottomWidget(double screenWidth) {
  //   return Container(
  //     width: 1.5 * screenWidth,
  //     height: 1.5 * screenWidth,
  //     decoration: const BoxDecoration(
  //       shape: BoxShape.circle,
  //       gradient: LinearGradient(
  //         begin: Alignment(0.6, -1.1),
  //         end: Alignment(0.7, 0.8),
  //         colors: [
  //           Color(0xDB4BE8CC),
  //           Color(0x005CDBCF),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  void initState() {
    createAccountContent = [
      inputField('Name', Ionicons.person_outline),
      inputField('Email', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed_outline),
      loginButton('Sign Up'),
      // orDivider(),
      // logos(),
    ];

    loginContent = [
      inputField('Email', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed_outline, true),
      loginButton('Log In'),
      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Positioned(
            top: 136,
            left: 24,
            child: TopText(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: createAccountContent,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: loginContent,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: BottomText(),
            ),
          ),
        ],
      ),
    );
  }
}
