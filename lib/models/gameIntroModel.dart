class CharacterConfiguration {
  String gameConfigName; // lang mei shouwei
  Map<int, CharacterSet> charConfigs;
  List<Object> specialIntroPool;

  CharacterConfiguration({
    this.gameConfigName,
    this.charConfigs,
    this.specialIntroPool,
  });
}

class CharacterSet {
  Map<Special, int> specials;
  Map<Wolf, int> wolves;
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
  bastard, // 混子
}

enum ThirdParty {
  cupid, // 丘比特
  link1, // 链子1
  link2, // 链子2
  robber, // 盗贼
  shadow, // 影子
  avenger, // 复仇者
}
