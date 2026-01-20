// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';
// import 'package:quiz_app/view/home_screen/home_screen.dart';
// import 'package:quiz_app/view/question_screen/question_screen.dart';

// import 'package:netflix_dec/view/user_name_screen/user_name_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.myCustomWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Quiz_Logo.webp"),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            CircularProgressIndicator(
              color: ColorConstants.myCustomRed,
            ),
          ],
        ),
      ),
    );
  }
}
