import 'package:equatable/equatable.dart';

import 'task_type_items.dart';

class TaskTypeState extends Equatable {
  final TaskTypeItems? taskTypeItem;
  final int? index;
  const TaskTypeState(
    this.taskTypeItem,
    this.index,
  );

  @override
  List<Object?> get props => [taskTypeItem, index];
}
