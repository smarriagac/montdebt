import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/session_repository.dart';
import '../../../../domain/repositories/session_repository.dart';
import '../go_true_client/go_true_client_supabase.dart';

part 'session_repository_provider.g.dart';

@riverpod
SessionRepository sessionRepository(SessionRepositoryRef ref) {
  return SessionRepositoryImpl(
    authClient: ref.watch(gotrueClientProvider),
  );
}
