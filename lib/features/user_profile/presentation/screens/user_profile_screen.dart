import 'package:flutter/material.dart';

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

  Future<void> _singOut(BuildContext context) async {}
}
