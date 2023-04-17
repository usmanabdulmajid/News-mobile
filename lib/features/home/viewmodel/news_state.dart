import 'package:flutter/foundation.dart';

import 'package:news_mobile/core/model/news.dart';

class NewsState {
  bool loading;
  String errorMessage;
  List<News> news;
  NewsState({
    this.loading = false,
    this.errorMessage = '',
    this.news = const [],
  });

  factory NewsState.initial() =>
      NewsState(loading: false, errorMessage: '', news: []);
  factory NewsState.loading() =>
      NewsState(loading: true, errorMessage: '', news: []);
  factory NewsState.failed(String errorMessage) =>
      NewsState(loading: false, errorMessage: errorMessage, news: []);
  factory NewsState.success(List<News> news) {
    return NewsState(loading: false, errorMessage: '', news: news);
  }

  NewsState copyWith({
    bool? loading,
    String? errorMessage,
    List<News>? news,
  }) {
    return NewsState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      news: news ?? this.news,
    );
  }

  @override
  String toString() =>
      'NewsState(loading: $loading, errorMessage: $errorMessage, news: $news)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsState &&
        other.loading == loading &&
        other.errorMessage == errorMessage &&
        listEquals(other.news, news);
  }

  @override
  int get hashCode => loading.hashCode ^ errorMessage.hashCode ^ news.hashCode;
}
