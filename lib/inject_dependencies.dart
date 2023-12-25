import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/data/repositories/session_repository.dart';
import 'core/domain/repositories/session_repository.dart';
import 'register_third_dependencies.dart';

final sl = GetIt.I;

Future<void> injectDependencies() async {
  await registerThirdDependencies();

  final SupabaseClient supabaseClient = Supabase.instance.client;

  sl.registerSingleton<SessionRepository>(
    SessionRepositoryImpl(authClient: supabaseClient.auth),
  );
}
