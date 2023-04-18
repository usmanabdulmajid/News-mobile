import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_mobile/core/utils/logger.dart';
import 'package:news_mobile/domain/news/inews_repository.dart';
import 'package:news_mobile/features/home/viewmodel/news_state.dart';
import 'package:news_mobile/injection_container.dart';

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier(
          locator<INewsRepository>(),
        ));

class NewsNotifier extends StateNotifier<NewsState> {
  final INewsRepository _newsRepository;
  NewsNotifier(this._newsRepository) : super(NewsState.initial());

  Future<void> news({String? category}) async {
    state = NewsState.loading();
    final result = await _newsRepository.news(category);
    if (result.success) {
      state = NewsState.success(result.data ?? []);
      logger.e(state.news[0].url);
    } else {
      state =
          NewsState.failed(result.error?.description ?? 'Something went wrong');
    }
  }
}
