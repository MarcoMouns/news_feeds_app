// To parse this JSON data, do
//
//     final articlesResponseModel = articlesResponseModelFromMap(jsonString);

import 'dart:convert';

class ArticlesResponseModel {
  ArticlesResponseModel({
    this.status,
    this.source,
    this.sortBy,
    this.articles,
  });

  String status;
  String source;
  String sortBy;
  List<ArticleModel> articles;

  factory ArticlesResponseModel.fromJson(String str) =>
      ArticlesResponseModel.fromMap(json.decode(str));

  factory ArticlesResponseModel.fromMap(Map<String, dynamic> json) =>
      ArticlesResponseModel(
        status: json["status"] == null ? null : json["status"],
        source: json["source"] == null ? null : json["source"],
        sortBy: json["sortBy"] == null ? null : json["sortBy"],
        articles: json["articles"] == null
            ? []
            : List<ArticleModel>.from(
                json["articles"].map((x) => ArticleModel.fromMap(x))),
      );
}

class ArticleModel {
  ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;

  factory ArticleModel.fromJson(String str) =>
      ArticleModel.fromMap(json.decode(str));

  factory ArticleModel.fromMap(Map<String, dynamic> json) => ArticleModel(
        author: json["author"] == null ? "" : json["author"],
        title: json["title"] == null ? "" : json["title"],
        description: json["description"] == null ? "" : json["description"],
        url: json["url"] == null ? "" : json["url"],
        urlToImage: json["urlToImage"] == null ? "" : json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"].toString()),
      );
}
