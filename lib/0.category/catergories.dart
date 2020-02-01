import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/data/wolfDatabase.dart';
import 'package:werewolf_quantjudge/models/category.dart';
import 'categoryItem.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class CatergoriesScreen extends StatelessWidget {
  final List<Category> categories = WolfDataBase().categories;
  final String title;

  CatergoriesScreen(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget categoryBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(
            title: Text(title),
          );
    var categorybody = SafeArea(
      child: GridView(
        padding: const EdgeInsets.all(15),
        children: categories
            .map((catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                  catData.routeName,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: categoryBar,
            child: categorybody,
          )
        : Scaffold(
            appBar: categoryBar,
            body: categorybody,
          );
  }
}
