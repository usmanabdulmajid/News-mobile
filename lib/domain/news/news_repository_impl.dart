import 'package:news_mobile/core/exception/app_exception.dart';
import 'package:news_mobile/core/model/base_error.dart';
import 'package:news_mobile/core/model/base_response.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/utils/logger.dart';
import 'package:news_mobile/data/news/inews_service.dart';
import 'package:news_mobile/domain/news/inews_repository.dart';

class NewsRepositoryImpl implements INewsRepository {
  final INewsService _newsService;
  NewsRepositoryImpl(this._newsService);

  @override
  Future<BaseResponse<List<News>, BaseError>> news(String? category) async {
    var response = BaseResponse<List<News>, BaseError>();
    try {
      final apiResult = await _newsService.getNewsFromAPI(category);
      for (var each in apiResult) {
        await _newsService.saveNewsToRemoteDB(each);
      }
      final result = await _newsService.getNewsFromRemoteDB(category);
      response.success = true;
      response.data = result;
    } on AppException catch (e) {
      response.success = false;
      logger.e(e);
      response.error = BaseError(description: e.message);
    } catch (e) {
      response.success = false;
      logger.e(e);
      response.error = BaseError(description: 'Something went wrong');
    }
    return response;
  }
}
