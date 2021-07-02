

import 'package:flutter/material.dart';

class SingleExtraItemsWidget extends StatefulWidget {
  final List options;
  final Function(String) onSelect;

  SingleExtraItemsWidget(
      {Key? key,
        required this.options,
        required this.onSelect})
      : super(key: key);

  @override
  _SingleExtraItemsState createState() {
    return _SingleExtraItemsState();
  }
}

class _SingleExtraItemsState extends State<SingleExtraItemsWidget> {
  String selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.options.length,
      separatorBuilder: (_, index) => Divider(color: Colors.grey,),
      itemBuilder: (_, index) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Text(widget.options[index]),
        trailing: Radio<String>(value: widget.options[index], onChanged: (value){
          setState(() {
            selectedOption = widget.options[index];
            widget.onSelect(selectedOption);
          });
        }, groupValue: selectedOption,),
        onTap: () {
          setState(() {
            selectedOption = widget.options[index];
            widget.onSelect(selectedOption);
          });
        },
      ),
    );
  }
}


class MultipleExtraItemsWidget extends StatefulWidget {
  final int maximumOption;
  final List options;
  final Function(List<String>) onSelect;

  MultipleExtraItemsWidget(
      {Key? key,
        required this.maximumOption,
        required this.options,
        required this.onSelect})
      : super(key: key);

  @override
  _MultipleExtraItemsState createState() {
    return _MultipleExtraItemsState();
  }


}

class _MultipleExtraItemsState extends State<MultipleExtraItemsWidget> {
  List<String> selectedOptions = new List.empty();
  @override


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.options.length,
      separatorBuilder: (_, index) => Divider(),
      itemBuilder: (_, index) => ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(widget.options[index]),
        tileColor: selectedOptions.contains(widget.options[index])? Colors.red : Colors.white,
        onTap: () {
          setState(() {
            if(selectedOptions.contains(widget.options[index])){
              selectedOptions.remove(widget.options[index]);
            }else{
              if(selectedOptions.length < widget.maximumOption) {
                selectedOptions = [...selectedOptions, widget.options[index]];
              }
            }
            widget.onSelect(selectedOptions);
          });
        },
      ),
    );
  }
}
