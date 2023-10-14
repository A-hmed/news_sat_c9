import 'package:flutter/material.dart';
import 'package:news_sat_c9/data/model/category_dm.dart';
import 'package:news_sat_c9/ui/screens/home/tabs/categories_tab/category_widget.dart';

class CategoriesTab extends StatelessWidget {
  final Function(CategoryDM) onCategoryClick;
  const CategoriesTab({super.key,required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        children: [
          Text("Pick your category of interest"),
          SizedBox(height: 28,),
          Expanded(
            child: GridView.builder(
                itemCount: CategoryDM.categories.length,
                itemBuilder: (context, index)
                => InkWell(
                    onTap: (){
                      onCategoryClick(CategoryDM.categories[index]);
                    },
                    child: CategoryWidget(categoryDM: CategoryDM.categories[index])),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: .8
                )),
          )
        ],
      ),
    );
  }
}
