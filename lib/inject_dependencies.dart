import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/presentation/blocs/repositories_provider/authentication_repository/authentication_reposiotry_provider.dart';
import 'core/presentation/blocs/repositories_provider/sesion_repository/session_repository_provider.dart';

Future<void> injectDependencies() async {
  await Supabase.initialize(
    url: const String.fromEnvironment('supabaseUrl'),
    anonKey: const String.fromEnvironment('supabaseAnonKey'),
  );
}

class Repositories {
  static final auth = authenticationRepositoryProvider;
  static final session = sessionRepositoryProvider;
}
