import '../../typedefs.dart';
import '../../failures/session_failure.dart';
import '../entities/user.dart';

abstract class SessionRepository {
  FutureEither<SessionFailure, User> getCurrentAuthenticatedUser();
  Future<void> signOut();
}
