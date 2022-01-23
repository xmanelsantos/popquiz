class Quiz {
  int id;
  String title;
  List<Question> questions;
  Quiz({
    required this.id,
    required this.title,
    required this.questions,
  });
}

class Question {
  int id = 0;
  String question = "";
  String description = "";
  Question({
    required this.id,
    required this.question,
    required this.description,
  });
}
