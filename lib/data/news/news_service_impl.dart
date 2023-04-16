import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_mobile/core/constants/api_constants.dart';
import 'package:news_mobile/core/constants/firebase_instances.dart';
import 'package:news_mobile/core/exception/app_exception.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/service/http/http_service.dart';
import 'package:news_mobile/core/utils/enums.dart';
import 'package:news_mobile/data/news/inews_service.dart';

class NewsServiceImpl implements INewsService {
  final CollectionReference _news = dbIntance.collection('news');
  final HttpService http;
  NewsServiceImpl(this.http);
  @override
  Future<List<News>> getNewsFromAPI(String? category) async {
    List<News> news = [];
    try {
      var x = category ?? '';
      if (x.isNotEmpty) {
        x = '&$x';
      }
      final result = await http(
          url: 'https://$newsUrl$x$newsApiKey', method: RequestMethod.get);
      final list = result['articles'] as List;
      news = list.map((e) => News.fromMap(e, category)).toList();
    } on AppException catch (e) {
      throw NetworkException(message: e.toString());
    } catch (e) {
      throw Exception(e);
    }
    return news;
  }

  @override
  Future<List<News>> getNewsFromRemoteDB(String? category) async {
    List<News> news = [];
    try {
      final result = await _news.get();
      news = result.docs
          .map((each) => News.fromMap(each.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
    return news;
  }

  @override
  Future<bool> saveNewsToRemoteDB(News news) async {
    bool result = false;
    try {
      await _news.doc().set(news.toMap());
      result = true;
    } catch (e) {
      throw Exception(e);
    }
    return result;
  }
}
