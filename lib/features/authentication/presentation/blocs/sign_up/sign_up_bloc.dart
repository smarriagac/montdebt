import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/sign_up_state.dart';

part 'sign_up_bloc.g.dart';

@Riverpod(keepAlive: true)
class SingUpBloc extends _$SingUpBloc {
  @override
  SignUpState build() => const SignUpState();

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: email.trim(),
    );
  }

  void onNameChanged(String name) {
    state = state.copyWith(
      name: name.trim(),
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password.trim(),
    );
  }
}
