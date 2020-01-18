import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/3.gameJudge/gameIntroduction/configCardGroup/configCard/configCard.dart';
import 'package:werewolf_quantjudge/3.gameJudge/gameIntroduction/configCardGroup/configCard/specialIntro.dart';
import '../../../data/wolfDatabase.dart';
import '../../../models/gameIntroModel.dart';

class ConfigCardGroup extends StatelessWidget {
  final List<CharacterConfiguration> configs =
      WolfDataBase().characterConfigurations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: configs.length,
      itemBuilder: (ctx, index) {
        // 每个card有一个配置名称，一组按人数配置的牌板.
        var gameConfigName = configs[index].gameConfigName;
        var charConfigs = configs[index].charConfigs;
        var specialChars = configs[index].specialIntroPool;
        return Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(gameConfigName),
                ),
                Container(
                  child: ConfigCard(gameConfigName, charConfigs, specialChars),
                ),

                // Container(
                //   child: Column(
                //     children: charConfigs.entries.map((charConfig) {
                //       return ConfigCard(charConfig.key, charConfig.value);
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
