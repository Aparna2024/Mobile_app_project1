import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(),
    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('General Settings'),
          onTap: () {
            // Add functionality for when this item is tapped
          },
        ),
        ListTile(
          title: Text('Notifications'),
          onTap: () {
            // Add functionality for when this item is tapped
          },
        ),
        ListTile(
          title: Text('Privacy'),
          onTap: () {
            // Add functionality for when this item is tapped
          },
        ),
        ListTile(
          title: Text('About'),
          onTap: () {
            // Add functionality for when this item is tapped
          },
        ),
      ],
    );
  }
}
