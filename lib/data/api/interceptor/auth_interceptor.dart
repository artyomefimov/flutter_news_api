import 'package:dio/dio.dart';
import 'package:flutter_news_api/data/api/token/token_holder.dart';

class AuthInterceptor extends Interceptor {
  static const String _authTokenName = "Authorization";
  late final TokenHolder _tokenHolder;

  AuthInterceptor(TokenHolder tokenHolder) {
    _tokenHolder = tokenHolder;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[_authTokenName] = await _tokenHolder.token;
    handler.next(options);
  }
}
