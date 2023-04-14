import 'package:http/http.dart';
import 'package:news_mobile/core/utils/enums.dart';

abstract class HttpService {
  set header(Map<String, dynamic> header);

  Future<Response> call({
    required String url,
    required RequestMethod method,
    dynamic params,
  });
}
