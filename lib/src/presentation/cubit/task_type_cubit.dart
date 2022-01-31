import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/src/presentation/cubit/task_type_items.dart';

import 'task_type_state.dart';

class TaskTypeCubit extends Cubit<TaskTypeState> {
  TaskTypeCubit() : super(const TaskTypeState(TaskTypeItems.myTask, 0));

  void getTaskTypes(TaskTypeItems items) {
    switch (items) {
      case TaskTypeItems.myTask:
        emit(const TaskTypeState(TaskTypeItems.myTask, 0));
        break;
      case TaskTypeItems.inProgress:
        emit(const TaskTypeState(TaskTypeItems.inProgress, 1));
        break;
      case TaskTypeItems.completed:
        emit(const TaskTypeState(TaskTypeItems.completed, 2));
        break;
    }
  }
}
