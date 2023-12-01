import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
class BuildDropDown extends StatefulWidget {
  final String hintText;
  final List<String> option;
  final TextEditingController controller;

  const BuildDropDown({Key? key, required this.hintText, required this.option, required this.controller}) : super(key: key);

  @override
  State<BuildDropDown> createState() => _State();
}

class _State extends State<BuildDropDown> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = widget.controller.text;
    return Padding(
      padding: EdgeInsets.only(left: AppSize.padding2(context)),
      child: DropdownButton<String>(
        value: widget.option.contains(selectedValue) ? selectedValue : null,
        hint: Text(widget.hintText,style: TextStyle(fontSize: 18),),
        items: widget.option.map((unit) {
          return DropdownMenuItem<String>(
            value: unit,
            child: Text(unit),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            widget.controller.text = value!;
          });
        },
        // Remove the underline
        underline: Container(),
      ),
    );
  }
}
