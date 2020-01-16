class CharacterConfiguration {
  String gameConfig; // lang mei shouwei
  Map<int, CharacterSet> charConfig;

  CharacterConfiguration({
    this.gameConfig,
    this.charConfig,
  });
}

class CharacterSet {
  Map<SpecialCharacter, int> specials;
  Map<WolfCharacter, int> wolves;
  Map<VillageCharacter, int> villagers;
}

enum SpecialCharacter {
  seer, // 预言家
  witch, // 女巫
  hunter, // 猎人
  idiot, // 白痴
  guard, // 守卫
  knight, // 骑士
  witcher, // 猎魔人
  blackMarketer // 黑市商人
}

enum WolfCharacter {
  brotherOldWolf, // 狼兄
  brotherYoungWolf, // 狼弟
  bloodMoonWolf, // 血月
  nightmareWolf, // 梦魇
  gunWolf, // 白狼王
  charmWolf, // 狼美人
  ordinWolf, // 普通狼
}

enum VillageCharacter {
  ordinVillager,
}
