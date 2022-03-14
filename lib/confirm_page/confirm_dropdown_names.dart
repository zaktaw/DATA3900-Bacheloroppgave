import 'package:bacheloroppgave/confirm_page/confirm_count.dart';
import 'package:flutter/material.dart';

const String pick_name = 'Velg navn';

class DropdownNames extends StatefulWidget {
  Function setIsObserverSelected;
  Function setObserverName;
  List<String> observers;

  DropdownNames(
      this.setIsObserverSelected, this.setObserverName, this.observers,
      {Key? key})
      : super(key: key) {
    setIsObserverSelected = this.setIsObserverSelected;
  }

  @override
  State<DropdownNames> createState() => _DropdownNamesState();
}

class _DropdownNamesState extends State<DropdownNames> {
  late List<String> observerNames;
  var selectedValue;

  @override
  void initState() {
    observerNames = widget.observers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DropdownButton<String>(
      isExpanded: true,
      hint: const  Text(pick_name),
      value: selectedValue,
      items: observerNames.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;
          widget.setIsObserverSelected();
          widget.setObserverName(value);
        });
      },
    ));
  }
}
