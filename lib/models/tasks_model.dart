import 'dart:convert';

class TaskModel {
  String id;
  String title;
  String description;
  bool status;
  int time;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.status,
      required this.time});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          status: json["status"],
          time: json["time"],
        );
  Map<String, dynamic> toJson(){
    return{
    "id":id,
    "description":description,
    "title":title,
    "status":status,
    "time":time
  };
  }
}
