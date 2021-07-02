import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final int min;
  final int max;
  final Function(int) onChanged;

  Counter({required this.onChanged, this.min = 1, required this.max});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int currentSelection = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {

              if (currentSelection > widget.min) {
                --currentSelection;
                widget.onChanged(currentSelection);
              }
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.exposure_minus_1,
                size: 20,
                color: Colors.white,
              )),
        ),
        SizedBox(width: 14),
        Text(
          '$currentSelection',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 14),
        GestureDetector(
          onTap: () {
            setState(() {

              if (currentSelection < widget.max) {
                ++currentSelection;
                widget.onChanged(currentSelection);
              }
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              )),
        ),
      ],
    );
  }
}
