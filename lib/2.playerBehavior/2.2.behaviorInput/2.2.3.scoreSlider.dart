import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  ScoreSlider(this.sliderScoreFunction);

  final Function sliderScoreFunction;

  @override
  _ScoreSlider createState() => _ScoreSlider();
}

class _ScoreSlider extends State<ScoreSlider> {
  double sliderScore = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Text(
            '分数: ${sliderScore.toDouble().toStringAsFixed(2)}',
          ),
        ),
        Container(
          width: 300,
          child: Slider(
            value: sliderScore,
            onChanged: (value) {
              setState(() {
                sliderScore = value;
                widget.sliderScoreFunction(value);
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.blue.withOpacity(0.3),
            min: 0.0,
            max: 50,
            divisions: 10000,
            label: '${sliderScore.toDouble().toStringAsFixed(2)}',
          ),
        ),
      ],
    );
  }
}
