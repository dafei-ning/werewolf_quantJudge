import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  ScoreSlider(this.sliderScore, this.sliderScoreFunction);

  double sliderScore = 0;
  Function sliderScoreFunction;

  @override
  _ScoreSlider createState() => _ScoreSlider();
}

class _ScoreSlider extends State<ScoreSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Text(
            '分数: ${widget.sliderScore.toDouble().toStringAsFixed(2)}',
          ),
        ),
        Container(
          width: 300,
          child: Slider(
            value: widget.sliderScore,
            onChanged: (value) {
              setState(() {
                widget.sliderScore = value;
                widget.sliderScoreFunction(value);
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.blue.withOpacity(0.3),
            min: 0.0,
            max: 50,
            divisions: 10000,
            label: '${widget.sliderScore.toDouble().toStringAsFixed(2)}',
          ),
        ),
      ],
    );
  }
}
