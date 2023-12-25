import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/finished_tasks_state.dart';

part 'finished_tasks_bloc.g.dart';

@riverpod
class FinishedTasksBloc extends _$FinishedTasksBloc {
  @override
  FinishedTasksState build() => const FinishedTasksState.loading();
}
