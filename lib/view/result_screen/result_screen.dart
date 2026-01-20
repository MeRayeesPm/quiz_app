import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final double percentage;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Round percentage to the nearest whole number for display
    final int roundedPercentage = percentage.round();

    return Scaffold(
      backgroundColor: ColorConstants.myCustomBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congrats!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: ColorConstants.myCustomWhite,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "$roundedPercentage% Score",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w500,
                color: ColorConstants.myCustomGreen,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "$correctAnswers / $totalQuestions correct",
              style: TextStyle(
                fontSize: 18,
                color: ColorConstants.myCustomWhite,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              height: screenHeight * 0.075,
              width: screenWidth * 0.75,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.myCustomOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: ColorConstants.myCustomWhite,
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (_) => false,
                  );
                },
                child: Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 30,
                    color: ColorConstants.myCustomWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
