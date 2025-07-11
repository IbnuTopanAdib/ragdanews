import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ragdanews/model/news.dart';
import 'package:intl/intl.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd MMM yyyy').format(news.publishedAt);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.naplesBlue500.color,
        title: Text(
          'Detail News',
          style: AppTextStyles.headline6Regular.copyWith(
            color: AppColors.neutral1.color,
          ),
        ),
        leading: InkWell(
          child: Image.asset('assets/icons/arrow_back.png'),
          onTap: () => context.pop(),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.neutral1.color,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${news.sourceName} | $date',
                style: AppTextStyles.headline8Regular.copyWith(
                  color: AppColors.neutral500.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(news.title, style: AppTextStyles.headline4SemiBold),
              const SizedBox(height: 8),
              if (news.description != null && news.description!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    news.description!,
                    style: AppTextStyles.headline8Regular,
                  ),
                ),
              _buildAuthorSection(),
              _buildImageSection(),
              const SizedBox(height: 24),
              _buildContentSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    if (news.urlToImage == null || news.urlToImage!.isEmpty) {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_not_supported,
          size: 48,
          color: Colors.grey,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        news.urlToImage!,
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,
        loadingBuilder:
            (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) return child;
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image_not_supported,
                      size: 48,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Failed to load image',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              );
            },
      ),
    );
  }

  Widget _buildAuthorSection() {
    if (news.author == null || news.author!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.neutral300.color,
            child: Image.asset(
              'assets/icons/person.png',
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              news.author!,
              style: AppTextStyles.headline8SemiBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    if (news.content == null || news.content!.isEmpty) {
      return Text(
        'No content available.',
        style: AppTextStyles.headline7Regular.copyWith(
          color: AppColors.neutral500.color,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Text(news.content!, style: AppTextStyles.headline7Regular);
  }
}
