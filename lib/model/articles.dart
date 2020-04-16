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
