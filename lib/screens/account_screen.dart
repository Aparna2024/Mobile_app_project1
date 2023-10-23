import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/auth_provider.dart';

class AccountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    User? user = authProvider.user ?? null;
    String userName = user != null ? user.username : "JohnDoe";
    String emailId = user != null? user.emailId : "johndoe@example.com";
    String streetAddress = user != null? user.streetAddress : "ABC street";
    String city = user != null? user.city : "ABC city";
    String zipCode = user != null? user.zipCode : "123456";

    return Scaffold(
      appBar: AppBar(
        title: Text('User Infomation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0), // Add space around the text
              child: Text(
                'Name:'+ userName,
                style: TextStyle(fontSize: 20), // Increase font size
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Email:' + emailId,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'StreetAddress: '+streetAddress,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'City: '+city,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Zipcode: '+zipCode,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
