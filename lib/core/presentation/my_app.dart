import 'package:flutter/material.dart';

import '../../features/authentication/presentation/screens/sign_up/sign_up_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SignUpScreen(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
