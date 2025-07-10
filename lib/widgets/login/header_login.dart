import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 211,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/header_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.9,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.naplesBlue500.color,
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom:
                24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RAGDANews',
                  style: AppTextStyles.headline2Bold.copyWith(color: AppColors.neutral1.color),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please log into your account',
                  style: AppTextStyles.headline7Regular.copyWith(color: AppColors.neutral1.color)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
