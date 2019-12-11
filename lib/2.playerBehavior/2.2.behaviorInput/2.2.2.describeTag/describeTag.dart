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
  void _describeTagChips() {
    List<Widget> chipsGroup = [];
    widget.tagList.forEach((describe) {
      chipsGroup.add(
        Container(
          child: ChoiceChip(
            label: Text('hahahahaaaa'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                isSelected = selected;
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text('hahahahaaaa'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
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
