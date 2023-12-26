import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presentation/router/routes.dart';
import '../../../../../core/presentation/utils/validations_ext.dart';
import '../../blocs/sign_in/sign_in_bloc.dart';
import '../../mixins/auth_form_mixin.dart';

class SignInScreen extends ConsumerWidget with AuthFormMixin {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(singInBlocProvider.notifier);
    final state = ref.watch(singInBlocProvider);

    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Sign In',
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
                  onChanged: bloc.onPasswordChanged,
                  validator: passwordValidator,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.blue,
                  onPressed:
                      state.email.isValidEmail && state.password.isValidPassword
                          ? () => _submit(context, bloc)
                          : null,
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => SignUpRoute().push(context),
                  child: const Text('Create a new account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context, SingInBloc bloc) async {
    final result = await bloc.submit();

    if (!context.mounted) return;

    result.when(
      right: (_) => ToDoRoute().go(context),
      left: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      ),
    );
  }
}
