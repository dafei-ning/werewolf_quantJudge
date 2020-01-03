import '../models/category.dart';
import 'package:flutter/material.dart';

class WolfDataBase {
  List<String> describeTagList = [
    '站错预言家',
    '疑似冲票行为',
    '狼视角保好人',
    '票型与身份相悖',
    '发言与身份相悖',
    '掰发言',
    '忽视抗推位',
    '狼视角爆刀口',
  ];

  List<Category> categories = [
    Category(
      id: 'c1',
      title: '组局',
      color: Colors.purple,
    ),
    Category(
      id: 'c2',
      title: '记录行为',
      color: Colors.pink,
    ),
    Category(
      id: 'c3',
      title: '个人资料',
      color: Colors.red,
    ),
    Category(
      id: 'c4',
      title: '湾区狼杀榜',
      color: Colors.yellow,
    ),
  ];
}
