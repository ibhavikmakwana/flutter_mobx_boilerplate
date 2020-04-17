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
