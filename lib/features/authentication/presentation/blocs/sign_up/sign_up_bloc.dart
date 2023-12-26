import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/domain/entities/user.dart';
import '../../../../../core/failures/failure.dart';
import '../../../../../core/presentation/blocs/repositories_provider/authentication_repository/authentication_reposiotry_provider.dart';
import '../../../../../core/presentation/blocs/session/session_bloc.dart';
import '../../../../../core/typedefs.dart';
import 'state/sign_up_state.dart';

part 'sign_up_bloc.g.dart';

@riverpod
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

  FutureEither<Failure, UserProfile> submit() async {
    final authenticationRepository = ref.read(authenticationRepositoryProvider);

    final result = await authenticationRepository.signUp(
      email: state.email,
      name: state.name,
      password: state.password,
    );

    final sessionBloc = ref.read(sessionBlocProvider.notifier);

    result.maybeWhen(
      right: (user) => sessionBloc.setUser(user),
      orElse: () {},
    );

    return result;
  }
}
