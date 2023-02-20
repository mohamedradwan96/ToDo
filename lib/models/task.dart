class Task {
  String id, title, description;
  int date;
  bool isdone;

  Task(
      {this.id = " ",
      required this.title,
      required this.description,
      required this.date,
      this.isdone = false});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "isDone": isdone,
    };
  }

  Task.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          date: json["date"],
          isdone: json["isDone"],
        );
}
