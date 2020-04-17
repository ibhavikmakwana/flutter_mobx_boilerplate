/*
 * BSD 2-Clause License
 *
 * Copyright (c) 2020, Bhavik Makwana
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
