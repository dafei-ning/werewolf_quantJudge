import 'package:flutter/material.dart';

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
