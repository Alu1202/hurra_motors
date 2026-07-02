import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_screen.dart';
import '../../../core/extensions/context_ext.dart';
import '../../components/app_bar/default_app_bar.dart';
import '../../components/buttons/button.dart';
import '../../components/input_fields/outlined_input_fields.dart';
import '../login_bloc.dart';
import '../login_event.dart';
import '../login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginBloc, LoginState>(
      create: (_) => LoginBloc(),
      builder: (context) {
        final bloc = context.read<LoginBloc>();

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'HURRA MOTORS',
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.primary,
                ),
              ),
              const Spacer(),

              LabeledOutlineTextField(
                label: 'User ID',
                controller: userIdController,
                onChanged: (val) => bloc.add(UserIdChanged(val)),
              ),

              const SizedBox(height: 16),

              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.isPasswordVisible != current.isPasswordVisible,
                builder: (context, state) {
                  return LabeledOutlineTextField(
                    label: 'Password',
                    controller: passwordController,
                    obscureText: !state.isPasswordVisible,
                    onChanged: (val) => bloc.add(PasswordChanged(val)),
                  );
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.maxFinite,
                child: PrimaryButton(
                  label: 'Login',
                  onPressed: () {
                    bloc.add(const LoginPressed());
                  },
                ),
              ),

              const Spacer(),
            ],
          ),
        );
      },
      appBar: const DefaultAppBar(title: 'Login'),
    );
  }
}
