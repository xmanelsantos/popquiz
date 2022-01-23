import 'package:hive/hive.dart';

part 'result.g.dart';

@HiveType(typeId: 0)
class Result extends HiveObject {
  @HiveField(0)
  late String id = '';

  @HiveField(1)
  late List<String> answers = [];

  @HiveField(2)
  late List<String> questions = [];

  @HiveField(3)
  late DateTime createdAt = DateTime.now();

  @HiveField(4)
  late String title = '';
}
