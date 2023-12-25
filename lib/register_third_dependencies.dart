import 'package:supabase_flutter/supabase_flutter.dart';

import 'inject_dependencies.dart';

Future<void> registerThirdDependencies() async {
  /// database
  sl.registerSingletonAsync<Supabase>(
    () => Supabase.initialize(
      url: const String.fromEnvironment('supabaseUrl'),
      anonKey: const String.fromEnvironment('supabaseAnonKey'),
    ),
  );
}
