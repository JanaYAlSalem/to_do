import '/dataLayer/model/task.dart';


abstract class TaskStates {}

class TaskInitialState extends TaskStates {}

class TaskAddState extends TaskStates {}

class TaskUpdateState extends TaskStates {}

class TaskDeleteState extends TaskStates {}

class TaskChangeState extends TaskStates {}
