class TaskModel {
  int id;
  String title;
  String startTime;
  String endTime;
  String description;
  String category;
  String status;

  TaskModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.category,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        description: json['description'],
        category: json['category'],
        status: json['status']);
  }
}

List<TaskModel> taskListFromJson(List list) {
  return List<TaskModel>.from(list.map((item) => TaskModel.fromJson(item)));
}
