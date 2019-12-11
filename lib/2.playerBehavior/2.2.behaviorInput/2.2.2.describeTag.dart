import 'package:flutter/material.dart';

class DescribeTag extends StatefulWidget {
  @override
  _DescribeTag createState() => _DescribeTag();
}

class _DescribeTag extends State<DescribeTag> {

  void _describeTagDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            _pickedDate == null
                ? '请选择行为标签!'
                : '标签: ${DateFormat.yMd().format(_pickedDate)}',
          ),
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
