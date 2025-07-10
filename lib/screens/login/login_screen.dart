import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ragdanews/router/router_names.dart';
import 'package:ragdanews/widgets/login/header_login.dart';
import 'package:ragdanews/widgets/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String _dummyEmail = 'test@example.com';
  final String _dummyPassword = 'password123';

  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _emailErrorText = null;
      _passwordErrorText = null;

      if (emailController.text.isEmpty) {
        _emailErrorText = 'Email tidak boleh kosong';
      }

      if (passwordController.text.isEmpty) {
        _passwordErrorText = 'Password tidak boleh kosong';
      } else if (passwordController.text.length < 8) {
        _passwordErrorText = 'Password minimal 8 karakter';
      }
    });
  }

  void _login() {
    _validateForm();

    if (_emailErrorText == null && _passwordErrorText == null) {
      if (emailController.text == _dummyEmail &&
          passwordController.text == _dummyPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Berhasil!')),
        );
        context.goNamed(RouterName.mainScreen); // Navigate to main screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email atau password salah.')),
        );
        setState(() {
          _passwordErrorText = 'Email atau password salah.';
        });
        print('Email atau password salah.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderLogin(),
          LoginForm(
            emailController: emailController,
            passwordController: passwordController,
            emailErrorText: _emailErrorText,
            passwordErrorText: _passwordErrorText,
            onLogin: _login,
            isLoginEnabled: _emailErrorText == null &&
                _passwordErrorText == null &&
                emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty,
          ),
        ],
      ),
    );
  }
}