import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ragdanews/model/news.dart';
import 'package:ragdanews/router/router_names.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({super.key, required this.news});

  String _formatAuthorName(String? author) {
    if (author == null || author.isEmpty) return '';
    return author.length > 20 ? '${author.substring(0, 20)}...' : author;
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd MMM yyyy').format(news.publishedAt);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${news.sourceName} | $date',
                  style: AppTextStyles.headline8Regular,
                ),
                const SizedBox(height: 8),
                Text(news.title, style: AppTextStyles.headline6SemiBold),
                const SizedBox(height: 8),
                _buildDescription(),
                Row(
                  children: [
                    _buildAuthorSection(),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(RouterName.detailScreen, extra: news);
                      },
                      child: const Text(
                        'Read More...',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (news.urlToImage == null || news.urlToImage!.isEmpty) {
      return _buildImagePlaceholder();
    }

    return Image.network(
      news.urlToImage!,
      width: double.infinity,
      height: 180,
      fit: BoxFit.cover,
      loadingBuilder:
          (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) return child;
            return _buildImageLoading();
          },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
            return _buildImagePlaceholder(error: error.toString());
          },
      frameBuilder:
          (
            BuildContext context,
            Widget child,
            int? frame,
            bool wasSynchronouslyLoaded,
          ) {
            if (wasSynchronouslyLoaded || frame != null) {
              return child;
            }
            return _buildImageLoading();
          },
    );
  }

  Widget _buildImagePlaceholder({String? error}) {
    return Container(
      width: double.infinity,
      height: 180,
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
          if (error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Gagal memuat gambar',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageLoading() {
    return Container(
      width: double.infinity,
      height: 180,
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildAuthorSection() {
    final author = news.author;
    if (author == null || author.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          child: Image.asset('assets/icons/person.png', fit: BoxFit.cover),
        ),
        const SizedBox(width: 3),
        Text(_formatAuthorName(author), style: AppTextStyles.headline8Regular),
      ],
    );
  }

  Widget _buildDescription() {
    if (news.description == null || news.description!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        news.description!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.headline9Regular,
      ),
    );
  }
}
