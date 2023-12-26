import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../features/authentication/data/authentication_repository_impl.dart';
import '../../../../../features/authentication/domain/repositories/authentication_repository.dart';
import '../go_true_client/go_true_client_supabase.dart';

part 'authentication_reposiotry_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
    authClient: ref.watch(
      gotrueClientProvider,
    ),
  );
}
