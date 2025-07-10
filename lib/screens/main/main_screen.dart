import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragdanews/provider/bottom_navigation_provider.dart';
import 'package:ragdanews/screens/dashboard/dashboard_screen.dart';
import 'package:ragdanews/screens/news/news_screen.dart';
import 'package:ragdanews/screens/profile/profile_screen.dart';
import 'package:ragdanews/style/colors/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationProvider>(
        builder: (context, provider, child) {
          return switch (provider.index) {
            0 => const DashboardScreen(),
            1 => const NewsScreen(),
            _ => const ProfileScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<BottomNavigationProvider>().index,
        onTap: (index) {
          context.read<BottomNavigationProvider>().setIndex = index;
        },
        selectedItemColor: AppColors.naplesBlue500.color,
        unselectedItemColor: AppColors.neutral300.color,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/dashboard_a.png',
              width: 24,
              height: 24,
            ),
            icon: Image.asset(
              'assets/icons/dashboard.png',
              width: 24,
              height: 24,
            ),
            label: "Dashboard",
            tooltip: "Dashboard",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/news_a.png',
              width: 24,
              height: 24,
            ),
            icon: Image.asset('assets/icons/news.png', width: 24, height: 24),
            label: "News",
            tooltip: "News",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/icons/profile_a.png',
              width: 24,
              height: 24,
            ),
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 24,
              height: 24,
            ),
            label: "Profile",
            tooltip: "Profile",
          ),
        ],
      ),
    );
  }
}
