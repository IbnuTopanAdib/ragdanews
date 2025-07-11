import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const EmailInput({
    super.key,
    required this.controller,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email'),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: AppTextStyles.headline7Regular.copyWith(
            color: AppColors.neutral6.color,
          ),
          decoration: InputDecoration(
            focusColor: AppColors.naplesBlue500.color,
            hintText: 'Cth. contoh@gmail.com',
            hintStyle: AppTextStyles.headline7Regular.copyWith(
              color: AppColors.neutral6.color,
            ),
            prefixIcon: Image.asset(
              'assets/icons/person.png',
              width: 24,
              height: 24,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey100.color,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}