import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/session_state.dart';

part 'session_bloc.g.dart';

@riverpod
class SessionBloc extends _$SessionBloc {
  @override
  SessionState build() => SessionState.loading();
}
