import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/user.dart';
import '../repositories_provider/sesion_repository/session_repository_provider.dart';
import 'state/session_state.dart';

part 'session_bloc.g.dart';

@Riverpod(keepAlive: true)
class SessionBloc extends _$SessionBloc {
  @override
  SessionState build() => SessionState.loading();

  Future<void> init() async {
    final sessionRepository = ref.read(sessionRepositoryProvider);
    final result = await sessionRepository.getCurrentAuthenticatedUser();

    log('RESULTADO USUARIO ACTUAL: $result');

    state = result.when(
      left: (_) => SessionState.loaded(null),
      right: SessionState.loaded,
    );
  }

  void setUser(UserProfile user) {
    state = SessionState.loaded(user);
  }
}
