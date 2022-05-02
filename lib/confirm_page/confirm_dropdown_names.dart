import 'package:bacheloroppgave/confirm_page/confirm_count.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

const String pick_name = 'Velg navn';

//Dropdown for selecting observername. Sets status of observerSelected used in confirm count 
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
    return Container(
        decoration: BoxDecoration(
            boxShadow: SHADOW_CONFIRM_DROPDOWN,
            borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS),
            color: DROPDOWN_COLOR),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height *
                CONFIRM_PAGE_DROPDOWN_MARGIN_FACTOR,
            left: MediaQuery.of(context).size.width *
                CONFIRM_PAGE_MARGIN_WIDTH_FACTOR,
            right: MediaQuery.of(context).size.width *
                CONFIRM_PAGE_MARGIN_WIDTH_FACTOR),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          isExpanded: true,
          hint: const Padding(
            child: Text(pick_name),
            padding: EdgeInsets.only(left: 20),
          ),
          value: selectedValue,
          items: observerNames.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                child: Text(value),
                padding: const EdgeInsets.only(left: 20),
              ),
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
