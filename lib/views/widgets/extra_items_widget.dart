import 'package:bixie_text/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingleExtraItemsWidget extends StatefulWidget {
  final List<ExtraItems> options;
  final Function(ExtraItems) onSelect;

  SingleExtraItemsWidget(
      {Key? key, required this.options, required this.onSelect})
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
      separatorBuilder: (_, index) => Divider(
        color: Colors.grey,
      ),
      itemBuilder: (_, index) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        title: Text(widget.options[index].name!),
        trailing: Radio<String>(
          value: widget.options[index].name!,
          onChanged: (value) {
            setState(() {
              selectedOption = widget.options[index].name!;
              widget.onSelect(widget.options[index]);
            });
          },
          groupValue: selectedOption,
        ),
        onTap: () {
          setState(() {
            selectedOption = widget.options[index].name!;
            widget.onSelect(widget.options[index]);
          });
        },
      ),
    );
  }
}

class MultipleExtraItemsWidget extends StatefulWidget {
  final int maximumOption;
  final List<ExtraItems> options;
  final Function(List<ExtraItems>) onSelect;

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
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(widget.options[index].name!),
        tileColor: selectedOptions.contains(widget.options[index].name)
            ? Colors.red
            : Colors.white,
        onTap: () {
          setState(() {
            if (selectedOptions.contains(widget.options[index].name)) {
              selectedOptions.remove(widget.options[index].name);
            } else {
              if (selectedOptions.length < widget.maximumOption) {
                selectedOptions = [
                  ...selectedOptions,
                  widget.options[index].name!
                ];
              } else {
                Fluttertoast.showToast(
                    msg:
                        "Maximum number of allowed options is '${widget.maximumOption}'");
              }
            }
            widget.onSelect(widget.options
                .where((element) => selectedOptions.contains(element.name))
                .toList());
          });
        },
      ),
    );
  }
}
