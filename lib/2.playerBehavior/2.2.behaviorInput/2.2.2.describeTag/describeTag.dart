import 'package:flutter/material.dart';

class DescribeTag extends StatefulWidget {
  final List<String> tagList;
  DescribeTag(this.tagList);
  @override
  _DescribeTag createState() => _DescribeTag();
}

class _DescribeTag extends State<DescribeTag> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text('hahahahaaaa'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          isSelected = selected;
        });
      },
    );
  }
}
