import 'package:bacheloroppgave/confirm_page/confirm_count.dart';
import 'package:flutter/material.dart';

class DropdownNames extends StatefulWidget {
  Function setIsObserverSelected;
  Function setObserverName;

  DropdownNames(this.setIsObserverSelected, this.setObserverName, {Key? key})
      : super(key: key) {
    setIsObserverSelected = this.setIsObserverSelected;
  }

  @override
  State<DropdownNames> createState() => _DropdownNamesState();
}

class _DropdownNamesState extends State<DropdownNames> {
  final List<String> names = <String>['Alf', 'Eva', 'Nils', 'Bob', 'Ida'];
  var selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DropdownButton<String>(
      isExpanded: true,
      hint: Text('Choose a name'),
      value: selectedValue,
      items: names.map((String value) {
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
