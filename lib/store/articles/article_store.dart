import 'package:fluttermobxboilerplate/model/articles.dart';
import 'package:fluttermobxboilerplate/network/custom_exception.dart';
import 'package:fluttermobxboilerplate/network/repository.dart';
import 'package:fluttermobxboilerplate/utility/utils.dart';
import 'package:mobx/mobx.dart';

part 'article_store.g.dart';

class ArticleStore = _ArticleStore with _$ArticleStore;

abstract class _ArticleStore with Store {
  final ArticleService _articleService = ArticleService();

  @observable
  Articles articles;

  @observable
  CustomException exception;

  @observable
  ObservableFuture<Articles> _articleFuture;

  @computed
  NetworkState get networkState {
    switch (_articleFuture.status) {
      case FutureStatus.pending:
        return NetworkState.loading;
        break;
      case FutureStatus.rejected:
        return NetworkState.error;
        break;
      case FutureStatus.fulfilled:
        return NetworkState.completed;
        break;
      default:
        return NetworkState.initial;
        break;
    }
  }

  @action
  Future<void> getArticles() async {
    try {
      _articleFuture = ObservableFuture(_articleService.fetchArticles());
      articles = await _articleFuture;
    } on CustomException catch (ce) {
      exception = ce;
    }
  }
}
