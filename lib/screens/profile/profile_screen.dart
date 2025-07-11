import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';
import 'package:ragdanews/widgets/profile/header_profile.dart';
import 'package:ragdanews/widgets/profile/logout_modal.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 261,
            child: HeaderProfile(),
          ),
          Positioned(
            top: 197,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Account Settings'),
                      const SizedBox(height: 16),
                      ..._buildProfileOptions([
                        {
                          'icon': 'assets/icons/person.png',
                          'text': 'Personal Information',
                        },
                        {
                          'icon': 'assets/icons/lock.png',
                          'text': 'Password & Security',
                        },
                        {
                          'icon': 'assets/icons/salary.png',
                          'text': 'Salary Slip Summary',
                        },
                        {
                          'icon': 'assets/icons/leave.png',
                          'text': 'Leave Summary',
                        },
                        {
                          'icon': 'assets/icons/overtime.png',
                          'text': 'Overtime Summary',
                        },
                        {
                          'icon': 'assets/icons/tax.png',
                          'text': 'Annual Tax Return PPH21',
                        },
                      ]),
                      const SizedBox(height: 24),
                      _buildSectionHeader('Other'),
                      const SizedBox(height: 16),
                      _buildProfileOption(
                        iconPath: 'assets/icons/logout.png',
                        text: 'Logout',
                        onTap: () {
                          _showLogoutModal(context);
                        },
                      ),
                      const SizedBox(height: 80.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.headline7Regular.copyWith(
        color: AppColors.neutral7.color,
      ),
    );
  }

  List<Widget> _buildProfileOptions(List<Map<String, dynamic>> options) {
    return options
        .map(
          (option) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _buildProfileOption(
              iconPath: option['icon'],
              text: option['text'],
              onTap: () {
                // Handle tap for other profile options if needed
              },
            ),
          ),
        )
        .toList();
  }

  Widget _buildProfileOption({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Text(text, style: AppTextStyles.headline7Regular),
      trailing: Image.asset(
        'assets/icons/arrow_forward.png',
        width: 24,
        height: 24,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutModal();
      },
    );
  }
}
