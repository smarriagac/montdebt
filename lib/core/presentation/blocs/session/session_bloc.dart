import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../inject_dependencies.dart';
import '../../../domain/repositories/session_repository.dart';
import 'state/session_state.dart';

part 'session_bloc.g.dart';

@riverpod
class SessionBloc extends _$SessionBloc {
  @override
  SessionState build() => SessionState.loading();

  Future<void> init() async {
    final SessionRepository sessionRepository = sl.get();
    final result = await sessionRepository.getCurrentAuthenticatedUser();
    state = result.when(
      left: (_) => SessionState.loaded(null),
      right: SessionState.loaded,
    );
  }
}
