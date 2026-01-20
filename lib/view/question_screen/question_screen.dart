import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';

import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const QuestionScreen({super.key, required this.questions});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // ColorConstants colorconstobj = ColorConstants();
  int questionIndex = 0;
  int? selectedAnswerIndex;
  bool isAnswerLocked = false;
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.myCustomBlack,
      appBar: AppBar(
        backgroundColor: ColorConstants.myCustomTransparent,
        actions: [
          Text(
            "  ${questionIndex + 1}/${widget.questions.length}",
            style: TextStyle(color: getQuestionIndexColor()),
          ),
          SizedBox(
            width: screenWidth * 0.02,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.myCustomGrey),
                child: Text(
                  widget.questions[questionIndex]["question"],
                  style: TextStyle(
                      color: ColorConstants.myCustomWhite, height: 1.5),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.questions[questionIndex]["options"].length,
                itemBuilder: (context, index) => InkWell(
                  onTap: isAnswerLocked
                      ? null
                      : () {
                          selectedAnswerIndex = index;
                          isAnswerLocked = true;

                          // Increment correct answer count if the selected
                          // option matches the correct answer for this question
                          if (index ==
                              widget.questions[questionIndex]["answer"]) {
                            correctAnswers++;
                          }

                          setState(() {});
                        },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: getRightAnswer(index),
                      //  selectedAnswerIndex == index
                      //  //   ? selectedAnswerIndex ==
                      //             QuestionDb.questions[questionIndex]["answer"]
                      //         ? ColorConstants.mycustomsGreen
                      //         : Colors.red
                      //     :
                      //   : ColorConstants.mycustomsgrey,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: getRightAnswer(index),
                        //selectedAnswerIndex == index
                        //     ? selectedAnswerIndex ==
                        //             QuestionDb.questions[questionIndex]
                        //                 ["answer"]
                        //         ? ColorConstants.mycustomsGreen
                        //         : ColorConstants.mycustomsred
                        //     : ColorConstants.mycustomsgrey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            widget.questions[questionIndex]["options"][index],
                            style: TextStyle(
                              color: ColorConstants.myCustomWhite,
                              height: 1.5,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundColor: ColorConstants.myCustomGrey,
                            radius: 12,
                            child: CircleAvatar(
                              backgroundColor: ColorConstants.myCustomBlack,
                              radius: 11,
                              child: buildRightAnswerIcons(index),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: screenHeight * 0.02,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.20,
              ),
              InkWell(
                onTap: () {
                  if (questionIndex < widget.questions.length - 1) {
                    questionIndex++;
                    selectedAnswerIndex = null;
                    isAnswerLocked = false;
                    print(questionIndex);
                    setState(() {});
                  } else {
                    final totalQuestions = widget.questions.length;
                    final percentage = (correctAnswers / totalQuestions) * 100;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          correctAnswers: correctAnswers,
                          totalQuestions: totalQuestions,
                          percentage: percentage,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.myCustomBlue,
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorConstants.myCustomWhite,
                          height: 1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // To get the color for question index text
  Color getQuestionIndexColor() {
    if (questionIndex >= 8 && questionIndex <= 10) {
      return Colors.red;
    } else if (questionIndex >= 6 && questionIndex <= 7) {
      return Colors.orange;
    } else if (questionIndex >= 3 && questionIndex <= 5) {
      return Colors.green;
    } else {
      return ColorConstants.myCustomBlue;
    }
  }

//// To show the correct color on answer selection

  Color getRightAnswer(int index) {
    if (selectedAnswerIndex != null &&
        index == widget.questions[questionIndex]["answer"]) {
      return ColorConstants.myCustomGreen;
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex == widget.questions[questionIndex]["answer"]) {
        return ColorConstants.myCustomGreen;
      } else {
        return ColorConstants.myCustomRed;
      }
    } else {
      return ColorConstants.myCustomGrey;
    }
  }

  Widget? buildRightAnswerIcons(int index) {
    if (selectedAnswerIndex != null &&
        index == widget.questions[questionIndex]["answer"]) {
      return Icon(Icons.done, color: ColorConstants.myCustomWhite);
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex == widget.questions[questionIndex]["answer"]) {
        return Icon(Icons.done, color: ColorConstants.myCustomWhite);
      } else {
        return Icon(Icons.close, color: ColorConstants.myCustomWhite);
      }
    } else {
      return SizedBox();
    }
  }
}
