import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presentation/router/routes.dart';
import '../../../../../core/presentation/utils/validations_ext.dart';
import '../../blocs/sign_up/sign_up_bloc.dart';
import '../../mixins/auth_form_mixin.dart';

class SignUpScreen extends ConsumerWidget with AuthFormMixin {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(singUpBlocProvider.notifier);
    final state = ref.watch(singUpBlocProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: bloc.onEmailChanged,
                  validator: emailValidator,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: bloc.onNameChanged,
                  validator: nameValidator,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: bloc.onPasswordChanged,
                  validator: passwordValidator,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: state.email.isValidEmail &&
                          state.password.isValidPassword &&
                          state.name.isValidName
                      ? () => _submit(context, bloc)
                      : null,
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context, SingUpBloc bloc) async {
    final result = await bloc.submit();
    if (!context.mounted) return;
    result.when(
      left: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      ),
      right: (_) {
        log('USUARIO $_');
        ToDoRoute().go(context);
      },
    );
  }
}
