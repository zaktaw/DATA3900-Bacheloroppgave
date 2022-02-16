import 'package:flutter/material.dart';

class ActivityTopbar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String sone;

  ActivityTopbar(
    this.sone, {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => print("test")),
      backgroundColor: Color.fromARGB(255, 189, 190, 187),
      centerTitle: true,
      title: InkWell(
        onTap: () => print("SONEINFO"),
        child: Text(sone),
      ),
      actions: [
        IconButton(
            onPressed: () => print("info"),
            icon: Icon(Icons.info_outline_rounded))
      ],
    );
  }
}
