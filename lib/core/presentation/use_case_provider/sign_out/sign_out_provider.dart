import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecases/sign_out.dart';
import '../../blocs/repositories_provider/notification_repository/notification_repository_provider.dart';
import '../../blocs/repositories_provider/sesion_repository/session_repository_provider.dart';
import '../../blocs/repositories_provider/web_socket_repository/web_socket_repository_provider.dart';

part 'sign_out_provider.g.dart';

@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  return SignOutUseCase(
    sessionRepository: ref.watch(sessionRepositoryProvider),
    notificationsRepository: ref.watch(notificationRepositoryProvider),
    websocketRepository: ref.watch(webSocketRepositoryProvider),
  );
}
