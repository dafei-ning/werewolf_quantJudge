import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  double sliderScore;

  ScoreSlider(this.sliderScore);
  @override
  _ScoreSlider createState() => _ScoreSlider();
}

class _ScoreSlider extends State<ScoreSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '分数: ${widget.sliderScore.toInt()}',
          style: TextStyle(fontSize: 15),
        ),
        Container(
          child: Slider(
            value: widget.sliderScore,
            onChanged: (value) {
              setState(() {
                widget.sliderScore = value;
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
