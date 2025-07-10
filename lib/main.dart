import 'package:flutter/material.dart';
import 'package:ragdanews/router/router_go.dart';
import 'package:ragdanews/style/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RAGDAnews',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.shared.router,
    );
  }
}