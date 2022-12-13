class Task {
  String id, title, description;
  int date;

  int time;

  bool isdone;

  Task(
      {this.id = " ",
      required this.title,
      required this.description,
      required this.date,
      required this.time,
      this.isdone = false});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "data": date,
      "time": time,
      "isDone": isdone,
    };
  }

  Task.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          date: json["data"],
          time: json["time"],
          isdone: json["isDone"],
        );
}
