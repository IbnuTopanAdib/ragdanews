import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot Password?',
        style: AppTextStyles.headline8Regular.copyWith(
          color: AppColors.red400.color,
        ),
      ),
    );
  }
}