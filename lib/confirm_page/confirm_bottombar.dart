import 'package:flutter/material.dart';

class ConfirmBottombar extends StatelessWidget {
  ConfirmBottombar(
        {Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black12,
      child: InkWell(
        onTap: null,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            children: <Widget>[
              Text('test',
                  style: TextStyle(
                      color: Color.fromARGB(255, 114, 114, 182))),
            ],
          ),
        ),
      ),
    );
  }
}
