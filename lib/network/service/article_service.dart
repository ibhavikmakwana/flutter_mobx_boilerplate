part of '../repository.dart';

class ArticleService {
  final HttpClient _httpClient = HttpClient();

  Future<Articles> fetchArticles() async {
    final response = await _httpClient
        .get('https://marvel.fandom.com/api/v1/Articles/List?limit=50');
    return Articles.fromJson(response);
  }
}
