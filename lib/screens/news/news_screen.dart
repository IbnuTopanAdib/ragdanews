import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ragdanews/model/news.dart';
import 'package:ragdanews/provider/news_list_provider.dart';
import 'package:ragdanews/static/news_response_state.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';
import 'package:ragdanews/widgets/news/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<NewsListProvider>().fetchTopHeadlines();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.naplesBlue500.color,
        title: Text(
          'News',
          style: AppTextStyles.headline6Regular.copyWith(
            color: AppColors.neutral1.color,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Berita Terkini',
                    style: AppTextStyles.headline4SemiBold,
                  ),
                ),
                Image.asset('assets/icons/search.png', width: 24, height: 24),
              ],
            ),
          ),
          Expanded(
            child: Consumer<NewsListProvider>(
              builder: (context, provider, child) {
                return switch (provider.state) {
                  NewsListIdleState _ => const Center(
                    child: Text(
                      'Menunggu data...',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  NewsListLoadingState _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  NewsListErrorState(:final error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Terjadi kesalahan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          error,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => provider.fetchTopHeadlines(),
                          child: const Text('Coba Lagi'),
                        ),
                      ],
                    ),
                  ),
                  NewsListLoadedState(:final data) => ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: data.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final News news = data[index];
                      return NewsCard(news: news);
                    },
                  ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
