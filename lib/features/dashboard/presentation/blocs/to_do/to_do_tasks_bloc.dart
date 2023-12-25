import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/to_do_tasks_state.dart';

part 'to_do_tasks_bloc.g.dart';

@riverpod
class ToDoTasksBloc extends _$ToDoTasksBloc {
  @override
  ToDoTasksState build() => const ToDoTasksState.loading();
}
