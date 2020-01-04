import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../behavior/behaviorHomePage.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (_) {
                return BehaviorHomePage(title);
              },
            )
          : MaterialPageRoute(
              builder: (_) {
                return BehaviorHomePage(title);
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              onPressed: selectCategory(context),
              color: Theme.of(context).textTheme.button.color,
              child: Text(
                '添加玩家行为',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            )
          : InkWell(
              onTap: () => selectCategory(context),
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.display1,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.7), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
    );
  }
}
