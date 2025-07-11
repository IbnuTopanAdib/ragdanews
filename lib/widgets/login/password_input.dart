import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password'),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: true,
          style: AppTextStyles.headline7Regular.copyWith(
            color: AppColors.neutral6.color,
          ),
          decoration: InputDecoration(
            focusColor: AppColors.naplesBlue500.color,
            hintText: 'Enter password',
            hintStyle: AppTextStyles.headline7Regular.copyWith(
              color: AppColors.neutral6.color,
            ),
            prefixIcon: Image.asset(
              'assets/icons/lock.png',
              width: 24,
              height: 24,
            ),
            suffixIcon: Image.asset(
              'assets/icons/visible.png',
              width: 24,
              height: 24,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey100.color, width: 1),
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
