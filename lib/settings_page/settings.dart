import 'package:flutter/material.dart';

import 'settings_item.dart';

class Settings extends StatelessWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SettingsItem(),
    );
  }
}