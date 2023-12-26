import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/use_case_provider/sign_out/sign_out_provider.dart';

class UserprofileScreen extends StatelessWidget {
  const UserprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _singOut(context),
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
    );
  }

  Future<void> _singOut(BuildContext context) async {
    final prov =
        ProviderScope.containerOf(context).read(signOutUseCaseProvider).call();
  }
}
