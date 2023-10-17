import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_sat_c9/data/model/articles_response.dart';
import 'package:news_sat_c9/data/model/sources_response.dart';

abstract class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "a2803275cc264f5ab82151862011361a";

 static Future<List<Source>> getSources(String categoryId) async {
   try {
     Uri url = Uri.parse("https://$baseUrl/v2/top-headlines/sources?apiKey=$apiKey&&category=$categoryId");
     Response response = await get(url);
     Map json = jsonDecode(response.body);
     SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
     if(response.statusCode >= 200 &&
         response.statusCode < 300 && sourcesResponse.sources?.isNotEmpty == true){
       return sourcesResponse.sources!;
     }
     throw Exception();
   }catch(_){
     rethrow;
   }
  }

  static Future<ArticlesResponse> getArticles(String sourceId)async{
   // Uri url = Uri.parse("https://$baseUrl/v2/everything?apiKey=$apiKey&sources=$sourceId");
    try{
      Uri url = Uri.https(baseUrl, "/v2/everything", {
        "apiKey": apiKey,
        "sources": sourceId
      });
      Response response = await get(url);
      ArticlesResponse articlesResponse =
      ArticlesResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300 &&
          articlesResponse.articles?.isNotEmpty == true){
        return articlesResponse;
      }else {
        throw Exception(articlesResponse.message);
      }
    }catch(_){
      rethrow;
    }
  }
}