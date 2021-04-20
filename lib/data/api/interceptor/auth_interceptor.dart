import 'package:dio/dio.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter_news_api/data/repo/news_repository_impl.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["Authorization"] =
        await EncryptedSharedPreferences().getString(NewsRepositoryImpl.apiKey);
    handler.next(options);
  }
}
