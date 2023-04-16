import 'package:news_mobile/core/model/base_error.dart';
import 'package:news_mobile/core/model/base_response.dart';
import 'package:news_mobile/core/model/news.dart';

abstract class INewsRepository {
  Future<BaseResponse<List<News>, BaseError>> news(String? category);
}
