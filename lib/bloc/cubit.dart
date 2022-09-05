import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/states.dart';
import '/dataLayer/model/task.dart';


class TaskCubit extends Cubit<TaskStates> {

  TaskCubit() : super(TaskInitialState());

  static TaskCubit get(context) => BlocProvider.of(context);


  List<Task> tasks = [];

  int taskCount() => tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    emit(TaskAddState());
  }

  void updateTask(Task task) {
    task.toggleDone();
    emit(TaskUpdateState());
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    emit(TaskDeleteState());
  }

}