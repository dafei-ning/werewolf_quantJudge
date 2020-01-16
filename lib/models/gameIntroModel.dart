class CharacterConfiguration {
  String gameConfig; // lang mei shouwei 
  Map<int, CharacterSet> charConfig;
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
  guard,  // 守卫
  knight, // 骑士
}

enum WolfCharacter {
  ordinWolf,



}

enum VillageCharacter {
  ordinVillager,
}

