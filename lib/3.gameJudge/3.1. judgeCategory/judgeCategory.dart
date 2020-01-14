import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/category.dart';
import 'judgeCateItem.dart';
import '../../data/wolfDatabase.dart';

class JudgeCategory extends StatelessWidget {
  final List<Category> judgeCategories = WolfDataBase().judgeCategories;
  @override
  Widget build(BuildContext context) {
    var categoryBody = GridView.count(
      primary: false,
      padding: const EdgeInsets.all(25),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      // ?
      shrinkWrap: false,
      childAspectRatio: MediaQuery.of(context).size.height / 600,
      children: judgeCategories
          .map((data) => JudgeCateItem(
                data.title,
                data.color,
                data.routeName,
              ))
          .toList(),
    );

    return categoryBody;
  }
}
