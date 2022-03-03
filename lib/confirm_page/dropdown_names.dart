import 'package:flutter/material.dart';

class DropdownNames extends StatefulWidget {
  const DropdownNames({Key? key}) : super(key: key);

  @override
  State<DropdownNames> createState() => _DropdownNamesState();
}

class _DropdownNamesState extends State<DropdownNames> {
  final List<String> names = <String>['Alf', 'Eva', 'Nils', 'Bob', 'Ida'];
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DropdownButton<String>(
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
        });
      },
    ));
  }
}
