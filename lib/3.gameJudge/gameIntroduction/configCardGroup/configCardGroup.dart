import 'package:flutter/material.dart';
import '../../../data/wolfDatabase.dart';
import '../../../models/gameIntroModel.dart';

class ConfigCardGroup extends StatelessWidget {
  final List<CharacterConfiguration> characterConfigurations =
      WolfDataBase().characterConfigurations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characterConfigurations.length,
      itemBuilder: (ctx, index) {
        return Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(characterConfigurations[index].gameConfigName),
                )
                Container(child: Row(children: <Widget>[
                  
                ],),)
              ],
            ),
          ),
        );
      },
    );
  }
}
