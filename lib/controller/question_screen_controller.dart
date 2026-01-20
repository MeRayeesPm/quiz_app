import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/view/question_db/question_db.dart';

class QuestionScreenController {
  Future<List<Map<String, dynamic>>> fetchSportsQuestions() async {
    try {
      final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=21&type=multiple',
      );
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return QuestionDb.SportsQuestions;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      // Map OpenTDB format to our local question format
      return results.map<Map<String, dynamic>>((raw) {
        final map = raw as Map<String, dynamic>;
        final String question = map['question'] as String;
        final String correct = map['correct_answer'] as String;
        final List<dynamic> incorrect =
            map['incorrect_answers'] as List<dynamic>;

        final options = <String>[...incorrect.cast<String>(), correct];
        options.shuffle();
        final int correctIndex = options.indexOf(correct);

        return {
          'question': question,
          'options': options,
          'answer': correctIndex,
        };
      }).toList();
    } catch (_) {
      // On any error, fall back to local questions
      return QuestionDb.SportsQuestions;
    }
  }

//===============================================================================================================
  Future<List<Map<String, dynamic>>> fetchMathsQuestions() async {
    try {
      final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=19&type=multiple',
      );
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return QuestionDb.MathsQuestions;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      // Map OpenTDB format to our local question format
      return results.map<Map<String, dynamic>>((raw) {
        final map = raw as Map<String, dynamic>;
        final String question = map['question'] as String;
        final String correct = map['correct_answer'] as String;
        final List<dynamic> incorrect =
            map['incorrect_answers'] as List<dynamic>;

        final options = <String>[...incorrect.cast<String>(), correct];
        options.shuffle();
        final int correctIndex = options.indexOf(correct);

        return {
          'question': question,
          'options': options,
          'answer': correctIndex,
        };
      }).toList();
    } catch (_) {
      // On any error, fall back to local questions
      return QuestionDb.MathsQuestions;
    }
  }

//===============================================================================================================
  Future<List<Map<String, dynamic>>> fetchPhysicsQuestions() async {
    try {
      final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=17&type=multiple',
      );
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return QuestionDb.PhysicsQuestions;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      // Map OpenTDB format to our local question format
      return results.map<Map<String, dynamic>>((raw) {
        final map = raw as Map<String, dynamic>;
        final String question = map['question'] as String;
        final String correct = map['correct_answer'] as String;
        final List<dynamic> incorrect =
            map['incorrect_answers'] as List<dynamic>;

        final options = <String>[...incorrect.cast<String>(), correct];
        options.shuffle();
        final int correctIndex = options.indexOf(correct);

        return {
          'question': question,
          'options': options,
          'answer': correctIndex,
        };
      }).toList();
    } catch (_) {
      // On any error, fall back to local questions
      return QuestionDb.PhysicsQuestions;
    }
  }

//===============================================================================================================
  Future<List<Map<String, dynamic>>> fetchChemistryQuestions() async {
    try {
      final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=17&type=multiple',
      );
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return QuestionDb.ChemistryQuestions;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      return results.map<Map<String, dynamic>>((raw) {
        final map = raw as Map<String, dynamic>;
        final String question = map['question'] as String;
        final String correct = map['correct_answer'] as String;
        final List<dynamic> incorrect =
            map['incorrect_answers'] as List<dynamic>;

        final options = <String>[...incorrect.cast<String>(), correct];
        options.shuffle();
        final int correctIndex = options.indexOf(correct);

        return {
          'question': question,
          'options': options,
          'answer': correctIndex,
        };
      }).toList();
    } catch (_) {
      return QuestionDb.ChemistryQuestions;
    }
  }

//===============================================================================================================
  Future<List<Map<String, dynamic>>> fetchHistoryQuestions() async {
    try {
      final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=23&type=multiple',
      );
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return QuestionDb.HistoryQuestions;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      return results.map<Map<String, dynamic>>((raw) {
        final map = raw as Map<String, dynamic>;
        final String question = map['question'] as String;
        final String correct = map['correct_answer'] as String;
        final List<dynamic> incorrect =
            map['incorrect_answers'] as List<dynamic>;

        final options = <String>[...incorrect.cast<String>(), correct];
        options.shuffle();
        final int correctIndex = options.indexOf(correct);

        return {
          'question': question,
          'options': options,
          'answer': correctIndex,
        };
      }).toList();
    } catch (_) {
      return QuestionDb.HistoryQuestions;
    }
  }

//===============================================================================================================
  Future<List<Map<String, dynamic>>> fetchGeographyQuestions() async {
    try {
      final uri = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=22&type=multiple',
      );
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        return QuestionDb.GeographyQuestions;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      return results.map<Map<String, dynamic>>((raw) {
        final map = raw as Map<String, dynamic>;
        final String question = map['question'] as String;
        final String correct = map['correct_answer'] as String;
        final List<dynamic> incorrect =
            map['incorrect_answers'] as List<dynamic>;

        final options = <String>[...incorrect.cast<String>(), correct];
        options.shuffle();
        final int correctIndex = options.indexOf(correct);

        return {
          'question': question,
          'options': options,
          'answer': correctIndex,
        };
      }).toList();
    } catch (_) {
      return QuestionDb.GeographyQuestions;
    }
  }
}
