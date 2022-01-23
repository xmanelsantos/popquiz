//? Esse é o modelo utilizado pra testes, o site mockapi.io coloca sempre o primeiro id.
// {
//     "id": "1",
//     "questionario": {
//       "id": 1,
//       "titulo": "Preferências pessoais",
//       "questoes": [
//         {
//           "id": 1,
//           "titulo": "Livro favorito",
//           "descricao": "Qual é o livro que você mais gostou até hoje?"
//         },
//         {
//           "id": 2,
//           "titulo": "Filme favorito",
//           "descricao": "Qual é o filme que você mais gostou até hoje?"
//         }
//       ]
//     }
//   }

// ? essa classe está organizada da forma do JSON
class FormatedQuiz {
  String? id;
  Questionario? questionario;

  FormatedQuiz({this.id, this.questionario});

  FormatedQuiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionario = json['questionario'] != null
        ? Questionario.fromJson(json['questionario'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (questionario != null) {
      data['questionario'] = questionario!.toJson();
    }
    return data;
  }
}

class Questionario {
  int? id;
  String? titulo;
  List<Questoes>? questoes;

  Questionario({this.id, this.titulo, this.questoes});

  Questionario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    if (json['questoes'] != null) {
      questoes = <Questoes>[];
      json['questoes'].forEach((v) {
        questoes!.add(Questoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    if (questoes != null) {
      data['questoes'] = questoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questoes {
  int? id;
  String? titulo;
  String? descricao;

  Questoes({this.id, this.titulo, this.descricao});

  Questoes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    return data;
  }
}
