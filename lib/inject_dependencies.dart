import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/data/repositories/session_repository.dart';
import 'core/domain/repositories/session_repository.dart';
import 'features/authentication/data/authentication_repository_impl.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'register_third_dependencies.dart';

final sl = GetIt.I;

Future<void> injectDependencies() async {
  await registerThirdDependencies();

  final GoTrueClient supabaseClient = Supabase.instance.client.auth;

  sl.registerSingleton<SessionRepository>(
    SessionRepositoryImpl(authClient: supabaseClient),
  );

  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(authClient: supabaseClient),
  );
}
