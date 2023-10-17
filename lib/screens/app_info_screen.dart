import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the UI for the App Info screen here
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info'),
      ),
      body: Center(
        child: Text('This is the App Info screen'),
      ),
    );
  }
}
