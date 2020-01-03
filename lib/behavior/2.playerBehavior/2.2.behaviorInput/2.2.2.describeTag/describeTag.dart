import 'package:flutter/material.dart';

class DescribeTag extends StatefulWidget {
  final List<String> tagList;
  final Function(String) onSelectionChanged;

  DescribeTag(this.tagList, {this.onSelectionChanged});
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
          margin: EdgeInsets.all(3),
          child: ChoiceChip(
            label: Text(describe),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            selected: selectedTag == describe,
            onSelected: (selected) {
              setState(() {
                selectedTag = describe;
                widget.onSelectionChanged(selectedTag);
              });
            },
          ),
        ),
      );
    });
    // 多选时参考：
    // widget.reportList.forEach((item) {
    //     choices.add(Container(
    //     padding: const EdgeInsets.all(2.0),
    //     child: ChoiceChip(
    //         label: Text(item),
    //         selected: selectedChoices.contains(item),
    //         onSelected: (selected) {
    //         setState(() {
    //             selectedChoices.contains(item)
    //                 ? selectedChoices.remove(item)
    //                 : selectedChoices.add(item);
    //         });
    //         },
    //     ),
    //     ));
    // });
    return chipsGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: _describeTagChips());
  }
}
