import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/database.dart';
import 'package:quiz_app/view/question_screen/question_screen.dart';
import 'package:quiz_app/view/question_db/question_db.dart';
import 'package:quiz_app/controller/question_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstants.myCustomBlack,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: DbData.Subject.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                final subjectName = DbData.Subject[index]["name"]!;
                final questions = await _getQuestionsForSubject(subjectName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(questions: questions),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(DbData.Subject[index]["image"]!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    DbData.Subject[index]["name"]!,
                    style: TextStyle(
                      color: ColorConstants.myCustomWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _getQuestionsForSubject(
      String subjectName) async {
    switch (subjectName) {
      case "Sports":
        // Use API for sports questions; fall back is handled inside controller
        return await QuestionScreenController().fetchSportsQuestions();
      case "Maths":
        // Use API for maths questions; fall back is handled inside controller
        return await QuestionScreenController().fetchMathsQuestions();
      case "Physics":
        // Use API for physics questions; fall back is handled inside controller
        return await QuestionScreenController().fetchPhysicsQuestions();
      case "Chemistry":
        // Use API for chemistry questions; fall back is handled inside controller
        return await QuestionScreenController().fetchChemistryQuestions();
      case "History":
        // Use API for history questions; fall back is handled inside controller
        return await QuestionScreenController().fetchHistoryQuestions();
      case "Geography":
        return await QuestionScreenController().fetchGeographyQuestions();
      default:
        return QuestionDb.SportsQuestions; // Default fallback
      //     case "Geography":
      //   return QuestionDb.GeographyQuestions;
      // default:
      //   return QuestionDb.SportsQuestions; // Default fallback
    }
  }
}
