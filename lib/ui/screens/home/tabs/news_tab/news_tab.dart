import 'package:flutter/material.dart';
import 'package:news_sat_c9/data/api_manager.dart';
import 'package:news_sat_c9/data/model/category_dm.dart';
import 'package:news_sat_c9/data/model/sources_response.dart';
import 'package:news_sat_c9/ui/screens/home/tabs/news_tab/news_list.dart';

class NewsTab extends StatefulWidget {
  final CategoryDM categoryDM;
  const NewsTab({required this.categoryDM});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryDM.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildTabs(snapshot.data!.sources!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildTabs(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  currentTabIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: sources.map((source) => buildTabWidget(source.name??"",
                    currentTabIndex == sources.indexOf(source)
                )).toList()
            ),
            Expanded(
              child: TabBarView(
                  children: sources
                      .map((singleSource) => NewsList(singleSource.id!))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) => Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.blue, width: 1)),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 18, color: isSelected ? Colors.white : Colors.blue),
      ));
}
