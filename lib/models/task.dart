class Task {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  String? startTime;
  String? endTime;

  Task(
      {required this.title,
      required this.description,
      required this.date,
      required this.startTime,
      required this.endTime});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "title": title,
      "description": description,
      "date": date?.toIso8601String(),
      "startTime": startTime,
      "endTime": endTime
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Task.fromMap(Map<String, Object?> map) {
    id = (map["id"] as int?)!;
    title = (map["title"] as String?)!;
    description = (map["description"] as String?)!;
    date = (DateTime.tryParse(map["date"] as String))!;
    startTime = (map["startTime"] as String?)!;
    endTime = (map["endTime"] as String?)!;
  }
}

enum TaskTypeItems { myTask, inProgress, completed }
