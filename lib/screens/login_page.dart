import 'package:flutter/material.dart';
import 'package:meal_planning_recipie_planning_app/custom_navbar.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/auth_provider.dart';
import '../services/database_helper.dart';
import 'registration_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    User? user = await DatabaseHelper.instance.getUserByUsernameAndPassword(username, password);
    if (user != null) {
      // Regular user login successful, navigate to display details page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomNavBar()));
      // Regular user login successful
      Provider.of<AuthProvider>(context, listen: false).setUser(user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomNavBar()));
    } else {
      // Login failed, show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid username or password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to registration page
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}