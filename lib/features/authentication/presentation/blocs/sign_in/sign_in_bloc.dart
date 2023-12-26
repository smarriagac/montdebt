import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/domain/entities/user.dart';
import '../../../../../core/failures/failure.dart';
import '../../../../../core/presentation/blocs/session/session_bloc.dart';
import '../../../../../core/typedefs.dart';
import '../../../../../inject_dependencies.dart';
import '../../../domain/repositories/authentication_repository.dart';
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

  FutureEither<Failure, UserProfile> submit() async {
    final AuthenticationRepository authrepository = sl.get();
    final result = await authrepository.signIn(
      email: state.email,
      password: state.password,
    );

    result.whenOrNull(
      right: (userProfile) =>
          ref.read(sessionBlocProvider.notifier).setUser(userProfile),
    );

    return result;
  }
}
