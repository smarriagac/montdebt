import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/websocket_repository.dart';
import '../../../../domain/repositories/websocket_repository.dart';

part 'web_socket_repository_provider.g.dart';

@riverpod
WebsocketRepository webSocketRepository(WebSocketRepositoryRef ref) {
  return WebsocketRepositoryImpl();
}
