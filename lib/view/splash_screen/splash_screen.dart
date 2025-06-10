// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
// import 'package:quiz_app/view/home_screen/home_screen.dart';
import 'package:quiz_app/view/question_screen/question_screen.dart';

// import 'package:netflix_dec/view/user_name_screen/user_name_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.myCustomBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '''QUIZ
                 APP''',
              style: TextStyle(
                  fontSize: 37, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: 20,
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
