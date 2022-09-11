class Task {
  final String? name;
  bool isDone;
  String? status;

  Task({this.name, this.isDone = false, this.status});

  void toggleDone() {
    isDone = !isDone;
  }
}