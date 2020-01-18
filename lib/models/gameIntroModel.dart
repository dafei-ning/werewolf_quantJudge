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
  CharacterSet({this.wolves, this.specials, this.villagers});
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
