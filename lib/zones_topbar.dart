import 'package:flutter/material.dart';
import 'zones_info_pop.dart';

class ZonesTopbar extends StatelessWidget with PreferredSizeWidget{
  final Size preferredSize;

  const ZonesTopbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => print('object')
        ),
        backgroundColor: Color.fromARGB(255, 189, 190, 187),
        centerTitle: true,
        title: const Text('Soner'),
        actions: const <Widget>[
          ZonesInfoPop('Zaka liker is')
        ],
        
    );
  }
}
