import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/states.dart';
import 'package:to_do/dataLayer/room/todoDatabase.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitialState());

  static TaskCubit get(context) => BlocProvider.of(context);

  int? taskCount;


  createDatabase() {
    AppDatabase().intialDB();
    emit(AppCreateDatabaseState());

  }


  insertToDatabase({required String title, required bool isDone,}) async {

    await AppDatabase().insertToDatabase("INSERT INTO 'tasks' ('title', 'isDone') VALUES('$title', '$isDone')",)
      .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());

      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
  }

  void getDataFromDatabase() {

    emit(AppGetDatabaseLoadingState());

    AppDatabase().readData().then((value) {
      emit(AppGetDatabaseState());
    });
  }

  void updateTask({required bool isDone, required int id,}) async {
    AppDatabase().updateData('UPDATE tasks SET isDone = $isDone WHERE id = $id').then((value) {
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({required int id,}) async {

    AppDatabase().deleteData('DELETE FROM tasks WHERE id = $id').then((value) {
      emit(AppDeleteDatabaseState());

    });
  }


  // getDatabase
  getDatabase() async {
    var response = await AppDatabase().readData();
    return response;
  }


  getDataLength ({required int length,}) async {
    taskCount = await length;
    emit(AppUpdateDatabaseLengthState());
  }

}
