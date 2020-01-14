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
      title: '湾区组局',
      color: Colors.purple,
      routeName: '/meetup',
    ),
    Category(
      id: 'c2',
      title: '玩家记录行为',
      color: Colors.pink,
      routeName: '/behavior-HomePage',
    ),
    Category(
      id: 'c3',
      title: '狼人杀小法官',
      color: Colors.red,
      routeName: '/game-judge',
    ),
    Category(
      id: 'c4',
      title: '狼人杀英雄榜',
      color: Colors.yellow,
      routeName: '/meetup',
    ),
  ];

  List<Category> judgeCategories = [
    Category(
      id: 'jc1',
      title: '创建房间',
      color: Colors.purple,
      routeName: '/create-room',
    ),
    Category(
      id: 'jc2',
      title: '进入房间',
      color: Colors.pink,
      routeName: '/enter-room',
    ),
    Category(
      id: 'jc3',
      title: '返回当前房间',
      color: Colors.red,
      routeName: '/return-to-room',
    ),
    Category(
      id: 'jc4',
      title: '查看游戏记录',
      color: Colors.red,
      routeName: '/check-game-info',
    ),
  ];

}
