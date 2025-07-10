import 'package:ragdanews/model/news.dart';

sealed class NewsListState {}

final class NewsListIdleState extends NewsListState {}

final class NewsListLoadingState extends NewsListState {}

final class NewsListErrorState extends NewsListState {
  final String error;
  NewsListErrorState(this.error);
}

final class NewsListLoadedState extends NewsListState {
  final List<News> data;
  NewsListLoadedState(this.data);
}
