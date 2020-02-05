import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EnterRoom extends StatelessWidget {
  static const routeName = '/enter-room';
  final String title;

  EnterRoom(this.title);

  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(
      content: Text('你获得了 猎人的抢！'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {},
      ),
    );

    var showGiftFromMarketer = Builder(
      builder: (context) => Center(
        child: Container(
          child: RaisedButton(
            child: Text('显示获得的礼物'),
            onPressed: () {
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );

    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );

    var body = TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '请输入房间号',
      ),
    );

    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: showGiftFromMarketer,
      ),
    );
  }
}
