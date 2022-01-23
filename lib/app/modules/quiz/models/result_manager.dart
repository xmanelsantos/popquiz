import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:popquiz/app/modules/quiz/models/result.dart';

class ResultManager extends ChangeNotifier {
  ResultManager() {
    _startResults();
  }

  late Box box;

  List<Result> allResults = [];

  Result selectedResult = Result();

  _startResults() async {
    await Hive.openBox('results');
    box = Hive.box('results');
    loadResults();
    notifyListeners();
  }

  addResult(Result resultForAdd) async {
    final result = Result()
      ..id = resultForAdd.id
      ..answers = resultForAdd.answers
      ..questions = resultForAdd.questions
      ..createdAt = resultForAdd.createdAt
      ..title = resultForAdd.title;

    box.add(result);
    await loadResults();
    notifyListeners();
  }

  loadResults() {
    allResults = box.values.toList().cast<Result>();
    // ignore: prefer_conditional_assignment
    if (allResults == null) {
      allResults = [];
    }
    notifyListeners();
  }

  setSelectResult(Result result) {
    selectedResult = result;
    notifyListeners();
  }
}
