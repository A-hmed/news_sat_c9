import 'package:flutter/material.dart';
import 'package:news_sat_c9/data/api_manager.dart';
import 'package:news_sat_c9/data/model/articles_response.dart';
import 'package:news_sat_c9/ui/widgets/article_widget.dart';

class NewsList extends StatelessWidget {
  String sourceId;
  NewsList(this.sourceId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceId),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return buildListView(snapshot.data!.articles!);
          }else if(snapshot.hasError){
             return Text(snapshot.error.toString());
          }else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildListView(List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticleWidget(article: articles[index]);
        }
    );
  }
}
