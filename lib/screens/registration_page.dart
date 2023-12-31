import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/database_helper.dart';
import 'login_page.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  bool isEmailValid(String email) {
    // Regular expression for validating an Email
    // This pattern ensures that the email follows a common email pattern
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    // Check if the email matches the pattern
    return emailRegex.hasMatch(email);
  }

  void _register(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;
    String emailId = emailIdController.text;
    String streetAddress = addressController.text;
    String city = cityController.text;
    String zipCode = zipCodeController.text;

    // Validate username and password (add more validation logic if needed)
    if (username.isNotEmpty && password.isNotEmpty && emailId.isNotEmpty) {
      User newUser = User(
          username: username,
          password: password,
          emailId: emailId,
          streetAddress: streetAddress,
          city: city,
          zipCode: zipCode);
      User? user = await DatabaseHelper.instance.getUserByEmailId(emailId);

      if (user != null) {
        // user already exists
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('User with the given emailId already exists!'),
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
      } else {
        if (!isEmailValid(emailId)) {
          // Registration failed, show an error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Failed to register user. Please make sure to enter valid email'),
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
        else if (username.length < 4 || password.length < 8) {
          // Invalid input, show an error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Invalid username or password!'),
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
        } else {
          int userId = await DatabaseHelper.instance.insertUser(newUser);
          if (userId != -1) {
            // Registration successful, show a success message
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text('User $userId registered successfully!'),
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
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please make sure to enter all details'),
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

    // Clear text fields after successful registration
    usernameController.clear();
    passwordController.clear();
    emailIdController.clear();
    addressController.clear();
    cityController.clear();
    zipCodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person),
                  hintText: 'Min 4 characters',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock),
                hintText: 'Min 8 characters (letters, symbols and numbers)',
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey)),

            ),
            TextField(
              controller: emailIdController,
              decoration: InputDecoration(labelText: 'EmailId', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'StreetAddress', border: OutlineInputBorder(), prefixIcon: Icon(Icons.account_box)),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City', border: OutlineInputBorder(), prefixIcon: Icon(Icons.account_box)),
            ),
            TextField(
              controller: zipCodeController,
              decoration: InputDecoration(labelText: 'ZipCode', border: OutlineInputBorder(), prefixIcon: Icon(Icons.account_box)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _register(context);
              },
              child: Text('Register'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to login page and remove the registration page from the stack
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Already have an account? Login here',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        )
      ),
    );
  }
}
