import 'package:flutter/material.dart';
import 'package:news_sat_c9/data/model/category_dm.dart';
import 'package:news_sat_c9/ui/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_sat_c9/ui/screens/home/tabs/news_tab/news_tab.dart';
import 'package:news_sat_c9/ui/screens/home/tabs/settings_tab/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = CategoriesTab(onCategoryClick: setCategory);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if(currentWidget is! CategoriesTab){
          currentWidget = CategoriesTab(onCategoryClick: setCategory,);
          setState(() {});
          return Future.value(false);
        }else {
          return Future.value(true);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("News app!"),
            toolbarHeight: MediaQuery.of(context).size.height * .1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          ),
          drawer: Drawer(
            child: buildDrawer()
          ),
          body: currentWidget,
        ),
      ),
    );
  }

  setCategory(CategoryDM newCategory) {
    currentWidget = NewsTab(categoryDM: newCategory);
    setState(() {});
  }

  buildDrawer() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(child: Text("News App"))),
      buildDrawerItem("Categories", Icons.list, (){
        currentWidget = CategoriesTab(onCategoryClick: setCategory);
        Navigator.pop(context);
        setState(() {});
      }),
      SizedBox(height: 12,),
      buildDrawerItem("Settings", Icons.settings, (){
        currentWidget = SettingsTab();
        Navigator.pop(context);
        setState(() {});
      })
    ],
  );

  buildDrawerItem(String title, IconData iconData, Function onClick) => 
      InkWell(
        onTap: (){
          onClick();
        },
        child: Row(
          children: [
            SizedBox(width: 8,),
            Icon(iconData, color: Colors.black, size: 35,),
            SizedBox(width: 8,),
            Text(title, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),)
          ],
        ),
      );
}