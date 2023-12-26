import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'go_true_client_supabase.g.dart';

@riverpod
GoTrueClient gotrueClient(GotrueClientRef ref) {
  return Supabase.instance.client.auth;
}
