// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  List<Item> items;
  String basepath;
  String offset;

  Articles({
    this.items,
    this.basepath,
    this.offset,
  });

  Articles copyWith({
    List<Item> items,
    String basepath,
    String offset,
  }) =>
      Articles(
        items: items ?? this.items,
        basepath: basepath ?? this.basepath,
        offset: offset ?? this.offset,
      );

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        basepath: json["basepath"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "basepath": basepath,
        "offset": offset,
      };
}

class Item {
  int id;
  String title;
  String url;
  int ns;

  Item({
    this.id,
    this.title,
    this.url,
    this.ns,
  });

  Item copyWith({
    int id,
    String title,
    String url,
    int ns,
  }) =>
      Item(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        ns: ns ?? this.ns,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        ns: json["ns"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "ns": ns,
      };
}
