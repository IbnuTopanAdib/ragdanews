import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ragdanews/services/api_service.dart';
import 'package:ragdanews/static/news_response_state.dart';

class NewsListProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  NewsListProvider(this._apiServices);

  NewsListState _state = NewsListIdleState();
  NewsListState get state => _state;

  Future<void> fetchTopHeadlines({String country = 'us'}) async {
    _state = NewsListLoadingState();
    notifyListeners();

    try {
      final result = await _apiServices.fetchTopHeadlines(country: country);

      _state = NewsListLoadedState(result.articles);
    } on SocketException {
      _state = NewsListErrorState("Tidak dapat terhubung ke internet. Periksa koneksi Anda.");
    } on TimeoutException {
      _state = NewsListErrorState("Waktu koneksi habis. Silakan coba lagi.");
    } catch (e) {
      _state = NewsListErrorState("Terjadi kesalahan. Silakan coba beberapa saat lagi.");
    }

    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    if (query.isEmpty) {
      return fetchTopHeadlines();
    }

    _state = NewsListLoadingState();
    notifyListeners();

    try {
      final response = await _apiServices.fetchEverything(query);
      _state = NewsListLoadedState(response.articles);
    } on SocketException {
      _state = NewsListErrorState("Tidak dapat terhubung ke internet. Periksa koneksi Anda.");
    } on TimeoutException {
      _state = NewsListErrorState("Waktu koneksi habis. Silakan coba lagi.");
    } catch (e) {
      _state = NewsListErrorState("Terjadi kesalahan saat mencari berita.");
    }

    notifyListeners();
  }
}
