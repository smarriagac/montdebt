import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/push_notifications_repository.dart';
import '../../../../domain/repositories/push_notifications_repository.dart';

part 'notification_repository_provider.g.dart';

@riverpod
PushNotificationsRepository notificationRepository(
    NotificationRepositoryRef ref) {
  return PushNotificationsRepositoryImpl();
}
