import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/profile_background.png',
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
          bottom: 90,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white, size: 24.0),
                  SizedBox(width: 16.0),
                  Text(
                    'Profile',
                    style: AppTextStyles.headline5SemiBold.copyWith(
                      color: AppColors.neutral1.color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.neutral1.color,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: const AssetImage(
                        'assets/images/profile_picture.jpg',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hasan Waulat',
                        style: AppTextStyles.headline3SemiBold.copyWith(
                          color: AppColors.neutral1.color,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Departemen A',
                        style: AppTextStyles.headline8Regular.copyWith(
                          color: AppColors.neutral1.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
