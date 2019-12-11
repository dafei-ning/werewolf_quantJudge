import 'package:flutter/material.dart';

class DescribeTag extends StatefulWidget {
  final List<String> tagList;
  DescribeTag(this.tagList);
  @override
  _DescribeTag createState() => _DescribeTag();
}

class _DescribeTag extends State<DescribeTag> {
  bool isSelected = false;

  String selectedTag;
  List<Widget> _describeTagChips() {
    List<Widget> chipsGroup = [];
    widget.tagList.forEach((describe) {
      chipsGroup.add(
        Container(
          child: ChoiceChip(
            label: Text(describe),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            selected: selectedTag == describe,
            onSelected: (selected) {
              setState(() {
                selectedTag = describe;
              });
            },
          ),
        ),
      );
    });
    return chipsGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: _describeTagChips());
  }
}
