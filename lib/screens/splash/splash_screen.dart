import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ragdanews/router/router_names.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToMain();
  }

  Future<void> goToMain() async {
    return Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        context.goNamed(RouterName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'RAGDANews',
          style: AppTextStyles.headline1Bold.copyWith(
            color: AppColors.naplesBlue500.color,
          ),
        ),
      ),
    );
  }
}
