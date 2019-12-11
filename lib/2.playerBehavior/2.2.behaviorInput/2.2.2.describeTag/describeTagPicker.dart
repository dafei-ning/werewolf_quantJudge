import 'package:flutter/material.dart';
import './describeTag.dart';

class DescribeTagPicker extends StatefulWidget {
  DescribeTagPicker(this.describeTagList);
  final List<String> describeTagList;
  @override
  _DescribeTagPicker createState() => _DescribeTagPicker();
}

class _DescribeTagPicker extends State<DescribeTagPicker> {
  void _describeTagDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('选择一个行为标签'),
          content: DescribeTag(widget.describeTagList),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text('请选择行为标签!'),
        ),
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          child: Text(
            '选择标签',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: _describeTagDialog,
        ),
      ],
    );
  }
}
