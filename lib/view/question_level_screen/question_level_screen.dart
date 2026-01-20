import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';

class QuestionLevelScreen extends StatelessWidget {
  const QuestionLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _levelButton(
                title: "Level 1",
                onTap: () {
                  // Navigate to Level 1
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              _levelButton(
                title: "Level 2",
                onTap: () {
                  // Navigate to Level 2
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              _levelButton(
                title: "Level 3",
                onTap: () {
                  // Navigate to Level 3
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _levelButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: ColorConstants.myCustomGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstants.myCustomWhite,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
