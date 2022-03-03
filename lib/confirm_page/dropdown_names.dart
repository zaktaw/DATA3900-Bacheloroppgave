import 'package:flutter/material.dart';

class DropdownNames extends StatelessWidget {
  DropdownNames({Key? key}) : super(key: key);

  final List<String> names = <String>['Alf', 'Eva', 'Nils', 'Bob', 'Ida'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DropdownButton<String>(
      items: <String>['A', 'B', 'C', 'D'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    ));
  }
}
