import 'dart:convert';

List<NewsArticle> newsArticleFromJson(String str) => List<NewsArticle>.from(json
    .decode(str)['articles']
    .map((x) => NewsArticle.fromJson(Map<String, dynamic>.from(x))));

class NewsArticle {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  String content;
  DateTime publishedAt;
  NewsArticle(
      {required this.source,
      this.author,
      required this.title,
      required this.description,
      required this.url,
      this.urlToImage,
      required this.content,
      required this.publishedAt});

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
      source: Source.fromJson(json["source"]),
      title: json["title"],
      description: json["description"],
      author: json["author"],
      url: json["url"],
      content: json["content"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]));
}

class Source {
  dynamic id;
  String name;
  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json["id"], name: json["name"]);
}
