import 'package:flutter/material.dart';
import 'package:meal_planning_recipie_planning_app/screens/login_page.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Text('This is the Logout screen'),
      ),
    );
  }
}
