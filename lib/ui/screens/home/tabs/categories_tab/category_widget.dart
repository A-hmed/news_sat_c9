import 'package:flutter/material.dart';
import 'package:news_sat_c9/data/model/category_dm.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;
  final Radius radius = const Radius.circular(24);

  const CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.backgroundColor,
          borderRadius: BorderRadius.only(
              topRight: radius,
              topLeft: radius,
              bottomLeft: categoryDM.isLeftSided ? Radius.zero : radius,
              bottomRight: !categoryDM.isLeftSided ? Radius.zero : radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath, height: MediaQuery.of(context).size.height * .12,),
          SizedBox(height: 8,),
          Text(categoryDM.title, style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
