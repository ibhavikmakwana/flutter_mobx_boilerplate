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

// This file has been generated using [https://app.quicktype.io/].
// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

class Articles {
  List<ArticleItem> items;
  String basepath;
  String offset;

  Articles({
    this.items,
    this.basepath,
    this.offset,
  });

  Articles copyWith({
    List<ArticleItem> items,
    String basepath,
    String offset,
  }) =>
      Articles(
        items: items ?? this.items,
        basepath: basepath ?? this.basepath,
        offset: offset ?? this.offset,
      );

  factory Articles.fromJson(String str) => Articles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Articles.fromMap(Map<String, dynamic> json) => Articles(
        items: List<ArticleItem>.from(json["items"].map((x) => ArticleItem.fromMap(x))),
        basepath: json["basepath"],
        offset: json["offset"],
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "basepath": basepath,
        "offset": offset,
      };
}

class ArticleItem {
  int id;
  String title;
  String url;
  int ns;

  ArticleItem({
    this.id,
    this.title,
    this.url,
    this.ns,
  });

  ArticleItem copyWith({
    int id,
    String title,
    String url,
    int ns,
  }) =>
      ArticleItem(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        ns: ns ?? this.ns,
      );

  factory ArticleItem.fromJson(String str) => ArticleItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleItem.fromMap(Map<String, dynamic> json) => ArticleItem(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        ns: json["ns"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "url": url,
        "ns": ns,
      };
}
