// class SignInBloc extends ValueNotifier<SignInState> {
//   SignInBloc(super.value);

//   void onEmailChanged(String email) {
//     value = value.copyWith(
//       email: email.trim(),
//     );
//   }

//   void onPasswordChanged(String password) {
//     value = value.copyWith(
//       password: password.trim(),
//     );
//   }
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'state/sign_in_state.dart';

part 'sign_in_bloc.g.dart';

@riverpod
class SingInBloc extends _$SingInBloc {
  @override
  SignInState build() => const SignInState();

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: email.trim(),
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password.trim(),
    );
  }
}
