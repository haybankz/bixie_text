import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Counter extends StatefulWidget {
  final Function(int) onChanged;

  Counter({required this.onChanged});

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
        //minus widget
        GestureDetector(
          onTap: () {
            setState(() {
              //decrement if quantity is greater than 1, else show message
              if (currentSelection > 1) {
                --currentSelection;
                widget.onChanged(currentSelection);
              } else {
                Fluttertoast.showToast(msg: 'Quantity cannot go below "1"');
              }
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6), shape: BoxShape.circle),
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

        //plus widget
        GestureDetector(
          onTap: () {
            setState(() {
              ++currentSelection;
              widget.onChanged(currentSelection);
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: Colors.brown, shape: BoxShape.circle),
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
