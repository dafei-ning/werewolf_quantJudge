// 根据具体的板子类型选人数
class CharacterConfiguration {
  GamePattern gameConfigName;
  Map<int, CharacterSet> charConfigs;
  List<Object> specialIntroPool;

  CharacterConfiguration({
    this.gameConfigName,
    this.charConfigs,
    this.specialIntroPool,
  });
}

// 根据人数选板子类型
class AmountConfiguration {
  int playerAmount;
  Map<GamePattern, CharacterSet> charConfigs;
  AmountConfiguration({this.playerAmount, this.charConfigs});
}

class CharacterSet {
  Map<Wolf, int> wolves;
  Map<Special, int> specials;
  Map<Villager, int> villagers;
  Map<ThirdParty, int> thirdParties;
  CharacterSet({
    this.wolves,
    this.specials,
    this.villagers,
    this.thirdParties,
  });
}

enum Special {
  seer, // 预言家
  witch, // 女巫
  hunter, // 猎人
  idiot, // 白痴
  guard, // 守卫
  knight, // 骑士
  witcher, // 猎魔人
  blackMarketer, // 黑市商人
  prohibiter, // 禁票长老
}

enum Wolf {
  brotherOldWolf, // 狼兄
  brotherYoungWolf, // 狼弟
  bloodMoonWolf, // 血月
  nightmareWolf, // 梦魇
  gunWolf, // 白狼王
  charmWolf, // 狼美人
  ordinWolf, // 普通狼
}

enum Villager {
  ordinVillager, // 普通村民
}

enum ThirdParty {
  cupid, // 丘比特
  link1, // 链子1
  link2, // 链子2
  robber, // 盗贼
  shadow, // 影子
  avenger, // 复仇者
  bastard, // 混子
}

enum GamePattern {
  charmWolf_guard,
  s_w_h_i,
  blackmarket_wBros,
  blood_witcher,
  cupid_robber,
  shadow_avenger,
  nightmare_guard,
  s_w_g_h_i3,
}
