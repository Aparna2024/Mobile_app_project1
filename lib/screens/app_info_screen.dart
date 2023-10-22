import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to Our App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Our app is a user-friendly and feature-rich application designed to make your life easier. It provides a wide range of functionalities that can help you manage your tasks, stay organized, and much more.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Key Features:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Task Management'),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Organizational Tools'),
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Customization Options'),
              ),
              // Add more features as needed
            ],
          ),
        ),
      ),
    );
  }
}
