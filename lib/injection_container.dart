import 'package:get_it/get_it.dart';
import 'package:news_mobile/core/service/http/http_service.dart';
import 'package:news_mobile/core/service/http/httpee.dart';
import 'package:news_mobile/data/auth/firebase_auth_impl.dart';
import 'package:news_mobile/data/auth/iauthentication.dart';
import 'package:news_mobile/data/news/inews_service.dart';
import 'package:news_mobile/data/news/news_service_impl.dart';
import 'package:news_mobile/domain/auth/auth_repository_impl.dart';
import 'package:news_mobile/domain/auth/iauth_repository.dart';
import 'package:news_mobile/domain/news/inews_repository.dart';
import 'package:news_mobile/domain/news/news_repository_impl.dart';

final locator = GetIt.I;

Future<void> setup() async {
  //domain -> repositories
  locator
    ..registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(locator()),
    )
    ..registerLazySingleton<INewsRepository>(
      () => NewsRepositoryImpl(locator()),
    )
    //data -> api
    ..registerLazySingleton<IAuthentication>(
      () => FirebaseAuthImpl(),
    )
    ..registerLazySingleton<INewsService>(
      () => NewsServiceImpl(locator()),
    )
    //services
    ..registerLazySingleton<HttpService>(
      () => Httpee(),
    );
}
