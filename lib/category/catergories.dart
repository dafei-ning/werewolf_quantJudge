import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/category.dart';
import 'categoryItem.dart';

import '../data/simulatedData.dart';

class CatergoriesScreen extends StatelessWidget {
  List<Category> categories = SimulateData().categories;

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: categories
          .map((catData) => CategoryItem(
                catData.title,
                catData.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
