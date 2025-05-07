import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // ColorConstants colorconstobj = ColorConstants();
  int questionIndex = 0;
  int? selectedAnswerIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.myCustomBlack,
      appBar: AppBar(
        backgroundColor: ColorConstants.myCustomTransparent,
        actions: [
          Text(
            "  ${questionIndex + 1}/${QuestionDb.questions.length}",
            style: TextStyle(
                color: questionIndex >= 5
                    ? Colors.red
                    : ColorConstants.myCustomBlue),
          ),
          SizedBox(
            width: 20,
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
                  QuestionDb.questions[questionIndex]["question"],
                  style: TextStyle(
                      color: ColorConstants.myCustomWhite, height: 1.5),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    QuestionDb.questions[questionIndex]["options"].length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    selectedAnswerIndex = index;
                    print(selectedAnswerIndex);
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
                            QuestionDb.questions[questionIndex]["options"]
                                [index],
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
                  height: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  selectedAnswerIndex = null;
                  if (questionIndex < QuestionDb.questions.length - 1) {
                    questionIndex++;
                    print(questionIndex);
                    setState(() {});
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.myCustomBlue,
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: ColorConstants.myCustomWhite, height: 1.5),
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

//// To show the correct color on answer selection

  Color getRightAnswer(int index) {
    if (selectedAnswerIndex != null &&
        index == QuestionDb.questions[questionIndex]["answer"]) {
      return ColorConstants.myCustomGreen;
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          QuestionDb.questions[questionIndex]["answer"]) {
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
        index == QuestionDb.questions[questionIndex]["answer"]) {
      return Icon(Icons.done, color: ColorConstants.myCustomWhite);
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          QuestionDb.questions[questionIndex]["answer"]) {
        return Icon(Icons.done, color: ColorConstants.myCustomWhite);
      } else {
        return Icon(Icons.close, color: ColorConstants.myCustomWhite);
      }
    } else {
      return SizedBox();
    }
  }
}
