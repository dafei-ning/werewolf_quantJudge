import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './describeTag.dart';

class DescribeTagPicker extends StatefulWidget {
  DescribeTagPicker(this.describeTagList, this.pickTagFunction);
  final Function pickTagFunction;
  final List<String> describeTagList;
  @override
  _DescribeTagPicker createState() => _DescribeTagPicker();
}

class _DescribeTagPicker extends State<DescribeTagPicker> {
  String _selectedTag;

  void _describeTagDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('选择某个/组行为标签'),
          content: Container(
            child: DescribeTag(widget.describeTagList,
                onSelectionChanged: (selectedChip) {
              setState(() {
                _selectedTag = selectedChip;
                widget.pickTagFunction(selectedChip);
              });
            }),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('提交行为标签'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            _selectedTag == null ? '请选择行为标签!' : '标签:    ${_selectedTag}',
          ),
        ),
        Platform.isIOS
            ? CupertinoButton(
                //textColor: Theme.of(context).primaryColor,
                child: Text(
                  '选择标签',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                onPressed: _describeTagDialog,
              )
            : FlatButton(
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
