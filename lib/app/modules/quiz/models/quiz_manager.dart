import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter/cupertino.dart';
import 'package:popquiz/app/modules/quiz/models/quiz.dart';

class QuizManager extends ChangeNotifier {
  QuizManager() {
    loadQuizzes();
  }

  List<FormatedQuiz> quizzes = [];

  final String _baseUrl = 'https://61ed9088634f2f00170cec68.mockapi.io/quizzes';

  final Client _client = Client();

  late FormatedQuiz selectedQuiz;

  loadQuizzes() async {
    final response = await _client.get(Uri.parse(_baseUrl));
    final List<dynamic> quizJson = json.decode(response.body);
    quizzes =
        quizJson.map((dynamic json) => FormatedQuiz.fromJson(json)).toList();
    notifyListeners();
  }

  setQuizSelect(FormatedQuiz quiz) {
    selectedQuiz = quiz;
    notifyListeners();
  }
}
