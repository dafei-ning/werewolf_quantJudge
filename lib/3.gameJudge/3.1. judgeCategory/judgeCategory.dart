import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/category.dart';
import 'judgeCateItem.dart';
import '../../data/wolfDatabase.dart';

class JudgeCategory extends StatelessWidget {
  final List<Category> judgeCategories = WolfDataBase().judgeCategories;
  @override
  Widget build(BuildContext context) {
    var categoryBody = GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 20,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      children: judgeCategories
          .map((data) => JudgeCateItem(
                data.title,
              ))
          .toList(),
    );

    return categoryBody;
  }
}
