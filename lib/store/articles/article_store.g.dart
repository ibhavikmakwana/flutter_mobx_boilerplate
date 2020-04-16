// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArticleStore on _ArticleStore, Store {
  Computed<NetworkState> _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState))
      .value;

  final _$articlesAtom = Atom(name: '_ArticleStore.articles');

  @override
  Articles get articles {
    _$articlesAtom.context.enforceReadPolicy(_$articlesAtom);
    _$articlesAtom.reportObserved();
    return super.articles;
  }

  @override
  set articles(Articles value) {
    _$articlesAtom.context.conditionallyRunInAction(() {
      super.articles = value;
      _$articlesAtom.reportChanged();
    }, _$articlesAtom, name: '${_$articlesAtom.name}_set');
  }

  final _$exceptionAtom = Atom(name: '_ArticleStore.exception');

  @override
  CustomException get exception {
    _$exceptionAtom.context.enforceReadPolicy(_$exceptionAtom);
    _$exceptionAtom.reportObserved();
    return super.exception;
  }

  @override
  set exception(CustomException value) {
    _$exceptionAtom.context.conditionallyRunInAction(() {
      super.exception = value;
      _$exceptionAtom.reportChanged();
    }, _$exceptionAtom, name: '${_$exceptionAtom.name}_set');
  }

  final _$_articleFutureAtom = Atom(name: '_ArticleStore._articleFuture');

  @override
  ObservableFuture<Articles> get _articleFuture {
    _$_articleFutureAtom.context.enforceReadPolicy(_$_articleFutureAtom);
    _$_articleFutureAtom.reportObserved();
    return super._articleFuture;
  }

  @override
  set _articleFuture(ObservableFuture<Articles> value) {
    _$_articleFutureAtom.context.conditionallyRunInAction(() {
      super._articleFuture = value;
      _$_articleFutureAtom.reportChanged();
    }, _$_articleFutureAtom, name: '${_$_articleFutureAtom.name}_set');
  }

  final _$getArticlesAsyncAction = AsyncAction('getArticles');

  @override
  Future<void> getArticles() {
    return _$getArticlesAsyncAction.run(() => super.getArticles());
  }

  @override
  String toString() {
    final string =
        'articles: ${articles.toString()},exception: ${exception.toString()},networkState: ${networkState.toString()}';
    return '{$string}';
  }
}
