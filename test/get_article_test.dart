import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermobxboilerplate/store/articles/article_store.dart';

void main() {
  test(
    'Get Articles test'
    'Check if Article is not empty',
    () async {
      final articlesStore = ArticleStore();
      await articlesStore.getArticles();
      expect(articlesStore.articles.items.isNotEmpty, true);
    },
  );
}
