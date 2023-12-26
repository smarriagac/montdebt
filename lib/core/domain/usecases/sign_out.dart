import '../repositories/push_notifications_repository.dart';
import '../repositories/session_repository.dart';
import '../repositories/websocket_repository.dart';

class SignOutUseCase {
  SignOutUseCase({
    required SessionRepository sessionRepository,
    required PushNotificationsRepository notificationsRepository,
    required WebsocketRepository websocketRepository,
  })  : _sessionRepository = sessionRepository,
        _notificationsRepository = notificationsRepository,
        _websocketRepository = websocketRepository;

  final SessionRepository _sessionRepository;
  final PushNotificationsRepository _notificationsRepository;
  final WebsocketRepository _websocketRepository;

  Future<void> call() async {
    await _sessionRepository.signOut();
    await _websocketRepository.disconnect();
    await _notificationsRepository.removeToken();
  }
}
