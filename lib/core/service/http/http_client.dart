import 'dart:io';

import 'package:http/http.dart';
import 'package:news_mobile/core/service/http/http_service.dart';
import 'package:news_mobile/core/utils/enums.dart';

class HttpClient implements HttpService {
  final Client client;
  HttpClient(this.client);
  @override
  Future<Response> call({
    required String url,
    required RequestMethod method,
    params,
  }) async {
    Response response;
    try {
      if (method == RequestMethod.delete) {
        response = await client.delete(Uri.parse(url), body: params);
      } else if (method == RequestMethod.post) {
        response = await client.post(Uri.parse(url), body: params);
      } else if (method == RequestMethod.put) {
        response = await client.put(Uri.parse(url), body: params);
      } else if (method == RequestMethod.patch) {
        response = await client.patch(Uri.parse(url), body: params);
      } else {
        response = await client.get(Uri.parse(url));
      }
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  set header(Map<String, dynamic> header) {
    // TODO: implement header
  }
}
