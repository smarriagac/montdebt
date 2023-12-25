import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/in_progress_tasks_state.dart';

part 'in_progress_tasks_bloc.g.dart';

@riverpod
class InProgressTasksBloc extends _$InProgressTasksBloc {
  @override
  InProgressTasksState build() => const InProgressTasksState.loading();
}
