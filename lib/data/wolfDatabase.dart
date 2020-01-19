import '../models/category.dart';
import '../models/gameIntroModel.dart';
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
      color: Colors.teal[100],
      routeName: '/create-room',
    ),
    Category(
      id: 'jc2',
      title: '进入房间',
      color: Colors.teal[200],
      routeName: '/enter-room',
    ),
    Category(
      id: 'jc3',
      title: '返回当前房间',
      color: Colors.teal[300],
      routeName: '/return-to-room',
    ),
    Category(
      id: 'jc4',
      title: '查看游戏记录',
      color: Colors.teal[400],
      routeName: '/check-game-info',
    ),
  ];

  List<CharacterConfiguration> characterConfigurations = [
    // 狼美守卫板子：12，13，15，16
    CharacterConfiguration(
      gameConfigName: '狼美守卫',
      charConfigs: {
        12: CharacterSet(
          wolves: {
            Wolf.charmWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.hunter: 1,
            Special.guard: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
          },
        ),
        13: CharacterSet(
          wolves: {
            Wolf.charmWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.hunter: 1,
            Special.guard: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
            Villager.bastard: 1,
          },
        ),
        15: CharacterSet(
          wolves: {
            Wolf.charmWolf: 1,
            Wolf.ordinWolf: 4,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.hunter: 1,
            Special.guard: 1,
            Special.prohibiter: 1
          },
          villagers: {
            Villager.ordinVillager: 5,
          },
        ),
        16: CharacterSet(
          wolves: {
            Wolf.charmWolf: 1,
            Wolf.ordinWolf: 4,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.hunter: 1,
            Special.guard: 1,
            Special.prohibiter: 1
          },
          villagers: {
            Villager.ordinVillager: 5,
            Villager.bastard: 1,
          },
        ),
      },
      specialIntroPool: [Special.guard, Wolf.charmWolf],
    ),

    CharacterConfiguration(
      gameConfigName: '预女黑白',
      charConfigs: {
        12: CharacterSet(
          wolves: {
            Wolf.brotherOldWolf: 1,
            Wolf.brotherYoungWolf: 1,
            Wolf.ordinWolf: 2,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.blackMarketer: 1,
            Special.idiot: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
          },
        ),
        13: CharacterSet(
          wolves: {
            Wolf.brotherOldWolf: 1,
            Wolf.brotherYoungWolf: 1,
            Wolf.ordinWolf: 2,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.blackMarketer: 1,
            Special.idiot: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
            Villager.bastard: 1,
          },
        ),
        15: CharacterSet(
          wolves: {
            Wolf.brotherOldWolf: 1,
            Wolf.brotherYoungWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.blackMarketer: 1,
            Special.idiot: 1,
            Special.hunter: 1,
          },
          villagers: {
            Villager.ordinVillager: 5,
          },
        ),
        16: CharacterSet(
          wolves: {
            Wolf.brotherOldWolf: 1,
            Wolf.brotherYoungWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.blackMarketer: 1,
            Special.idiot: 1,
            Special.hunter: 1,
          },
          villagers: {
            Villager.ordinVillager: 5,
            Villager.bastard: 1,
          },
        ),
      },
      specialIntroPool: [
        Special.blackMarketer,
        Wolf.brotherOldWolf,
        Wolf.brotherYoungWolf
      ],
    ),

    CharacterConfiguration(
      gameConfigName: '梦魇守卫',
      charConfigs: {
        12: CharacterSet(
          wolves: {
            Wolf.nightmareWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.hunter: 1,
            Special.guard: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
          },
        ),
        13: CharacterSet(
          wolves: {
            Wolf.nightmareWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.hunter: 1,
            Special.guard: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
            Villager.bastard: 1,
          },
        ),
      },
      specialIntroPool: [Special.guard, Wolf.nightmareWolf],
    ),

    CharacterConfiguration(
      gameConfigName: '血月猎魔',
      charConfigs: {
        12: CharacterSet(
          wolves: {
            Wolf.bloodMoonWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.witcher: 1,
            Special.idiot: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
          },
        ),
        13: CharacterSet(
          wolves: {
            Wolf.bloodMoonWolf: 1,
            Wolf.ordinWolf: 3,
          },
          specials: {
            Special.seer: 1,
            Special.witch: 1,
            Special.witcher: 1,
            Special.idiot: 1,
          },
          villagers: {
            Villager.ordinVillager: 4,
            Villager.bastard: 1,
          },
        ),
      },
      specialIntroPool: [Special.witcher, Wolf.bloodMoonWolf],
    ),

    CharacterConfiguration(
      gameConfigName: '预女猎白',
      charConfigs: {
        11: CharacterSet(),
      },
      specialIntroPool: [Special.idiot],
    ),

    CharacterConfiguration(
      gameConfigName: '丘比特盗贼',
      charConfigs: {
        11: CharacterSet(),
        12: CharacterSet(),
      },
      specialIntroPool: [Special.idiot],
    ),

    CharacterConfiguration(
      gameConfigName: '影子复仇者',
      charConfigs: {
        14: CharacterSet(),
        16: CharacterSet(),
      },
    ),
  ];
}
