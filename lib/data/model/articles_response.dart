import 'package:news_sat_c9/data/model/sources_response.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  ArticlesResponse({
      this.status, 
      this.totalResults, 
      this.articles});

  ArticlesResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    code = json["code"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["code"] = code;
    map["message"] = message;
    map["totalResults"] = totalResults;
    if (articles != null) {
      map["articles"] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content});

  Article.fromJson(dynamic json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urlToImage;
    map["publishedAt"] = publishedAt;
    map["content"] = content;
    return map;
  }

}