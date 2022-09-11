import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/bloc/states.dart';
import '/ui/widgets/task_tile.dart';
import 'package:to_do/bloc/cubit.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Map>> readtask() async {
      List<Map> r = await TaskCubit.get(context).getDatabase();
      return r;
    }

    return BlocConsumer<TaskCubit, TaskStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            children: [
              FutureBuilder(
                  future: readtask(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map>> snapshot) {
                    int? lengthData = snapshot.data?.length;
                    if (lengthData == null) {
                      TaskCubit.get(context).getDataLength(length: 0);
                      return Center(
                        child: ListTile(
                          title: Text(
                            " You don't have tasks yet ",
                            style: TextStyle(fontSize: 24, color: Colors.grey),
                          ),
                        ),
                      );
                    } else {
                      TaskCubit.get(context).getDataLength(length: lengthData);

                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var idTask = snapshot.data![index]['id'];
                            var isDone = snapshot.data![index]['isDone'];

                            return Card(
                              child: TaskTile(
                                taskTitle: "${snapshot.data![index]['title']}",
                                isChecked: isC(isDone),
                                checkboxCallback: (checkboxState) {
                                  TaskCubit.get(context).updateTask(
                                      isDone: !isC(isDone), id: idTask);
                                },
                                longPressCallback: () {
                                  TaskCubit.get(context).deleteData(id: idTask);
                                },
                              ),
                            );
                          });
                    }
                  }),
            ],
          );
        });
  }
}

bool isC(dynamic isDone) {
  if (isDone == "false" || isDone == 0) {
    return false;
  } else
    return true;
}
