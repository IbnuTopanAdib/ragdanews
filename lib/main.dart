import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragdanews/provider/bottom_navigation_provider.dart';
import 'package:ragdanews/provider/news_list_provider.dart';
import 'package:ragdanews/router/router_go.dart';
import 'package:ragdanews/services/api_service.dart';

void main() {
  final apiService = ApiServices();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => apiService),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(
          create: (context) => NewsListProvider(context.read<ApiServices>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RAGDAnews',
      routerConfig: AppRouter.shared.router,
    );
  }
}
