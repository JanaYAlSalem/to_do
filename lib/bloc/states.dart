import '/dataLayer/model/task.dart';


abstract class TaskStates {}

class TaskInitialState extends TaskStates {}

class TaskAddState extends TaskStates {}

class TaskUpdateState extends TaskStates {}

class TaskDeleteState extends TaskStates {}

class TaskChangeState extends TaskStates {}


// database

class AppCreateDatabaseState extends TaskStates {}

class AppInsertDatabaseState extends TaskStates {}

class AppGetDatabaseLoadingState extends TaskStates {}

class AppGetDatabaseState extends TaskStates {}

class AppUpdateDatabaseState extends TaskStates {}

class AppDeleteDatabaseState extends TaskStates {}

class AppUpdateDatabaseLengthState extends TaskStates {}