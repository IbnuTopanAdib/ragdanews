import 'package:flutter/material.dart';
import 'package:ragdanews/widgets/login/email_input.dart';
import 'package:ragdanews/widgets/login/forgot_password_text.dart';
import 'package:ragdanews/widgets/login/login_button.dart';
import 'package:ragdanews/widgets/login/password_input.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? emailErrorText;
  final String? passwordErrorText;
  final VoidCallback onLogin;
  final bool isLoginEnabled;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.emailErrorText,
    required this.passwordErrorText,
    required this.onLogin,
    required this.isLoginEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailInput(
            controller: emailController,
            errorText: emailErrorText,
          ),
          const SizedBox(height: 16),
          PasswordInput(
            controller: passwordController,
            errorText: passwordErrorText,
          ),
          const SizedBox(height: 8),
          const ForgotPasswordText(),
          const SizedBox(height: 24),
          LoginButton(
            onPressed: isLoginEnabled ? onLogin : null,
          ),
        ],
      ),
    );
  }
}