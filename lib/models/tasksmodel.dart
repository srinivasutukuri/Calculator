class TaskModel {
  String taskName;
  String taskDetails;
  bool completed;
  int ct;
  String id;

  TaskModel({
    required this.taskName,
    required this.taskDetails,
    required this.completed,
    required this.ct,
    required this.id,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) => TaskModel(
        taskName: json["taskName"],
        taskDetails: json["taskDetails"],
        completed: json["completed"],
        ct: json["ct"],
        id: id,
      );

  Map<String, dynamic> toJson() => {
        "taskName": taskName,
        "taskDetails": taskDetails,
        "completed": completed,
        "ct": ct,
      };
}
