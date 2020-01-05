import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String routeName;

  Category({
    @required this.id,
    @required this.title,
    @required this.routeName,
    this.color = Colors.indigo,
  });
}
