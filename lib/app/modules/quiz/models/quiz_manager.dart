import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter/cupertino.dart';
import 'package:popquiz/app/modules/quiz/models/quiz.dart';

class QuizManager extends ChangeNotifier {
  late List<Quiz> _quizzes = [];

  final String _baseUrl = 'https://61ed9088634f2f00170cec68.mockapi.io/quizzes';

  final Client _client = Client();

  late Quiz selectedQuiz;

  setQuizSelect(Quiz quiz) {
    selectedQuiz = quiz;
    notifyListeners();
  }
}
