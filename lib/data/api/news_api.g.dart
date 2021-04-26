// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsApi implements NewsApi {
  _NewsApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewsResponse> getTopArticles(country, category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'country': country,
      r'category': category
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewsResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/top-headlines',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NewsResponse> getAllArticles(
      quoteInTitle, language, sortBy, pageSize, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'qInTitle': quoteInTitle,
      r'language': language,
      r'sortBy': sortBy,
      r'pageSize': pageSize,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NewsResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/everything',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
