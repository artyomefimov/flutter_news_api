// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter_news_api/data/model/news_response.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:retrofit/http.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;

  @GET("/top-headlines")
  Future<NewsResponse> getTopArticles(
    @Query("country") String? country,
    @Query("category") String? category,
  );

  @GET("/everything")
  Future<NewsResponse> getAllArticles(
    @Query("language") String? language,
    @Query("sortBy") String? sortBy,
    @Query("pageSize") int pageSize,
    @Query("page") int page,
  );
}
