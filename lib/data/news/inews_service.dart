import 'package:news_mobile/core/model/news.dart';

abstract class INewsService {
  Future<List<News>> getNewsFromAPI(String? category);
  Future<bool> saveNewsToRemoteDB(News news);
  Future<List<News>> getNewsFromRemoteDB(String? category);
}
