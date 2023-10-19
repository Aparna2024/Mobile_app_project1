import 'package:flutter/material.dart';
import 'package:meal_planning_recipie_planning_app/screens/login_page.dart';
import 'package:provider/provider.dart';
import '/provider/provider.dart';
import '/custom_theme.dart';
import 'package:sizer/sizer.dart';

import 'custom_navbar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListOfRecipes()),
        ChangeNotifierProvider(create: (_) => SavedProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        //  theme: CustomTheme.lightTheme,
        home: isLoggedIn ? const CustomNavBar() : LoginPage(),
      );
    });
  }
}
