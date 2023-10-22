import 'package:flutter/material.dart';
import 'package:meal_planning_recipie_planning_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '/screens/screens.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> categoryNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> savedNavigatorKey =
      GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> planningNavigatorKey =
  GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> pages(bool isLoggedIn) {
    return [
      const HomeScreen(),
      const CategoryScreen(),
      if (isLoggedIn) const MealPlanningScreen(),
      const SavedScreen(),
      if (isLoggedIn) const ProfileScreen(),
    ];
  }

  /*static List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const MealPlanningScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];*/

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    bool isLoggedIn = authProvider.isLoggedIn ?? false;

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(UniconsLine.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(UniconsLine.apps),
        label: 'Category',
      ),
      
    ];

    if (isLoggedIn) {
      items.add(
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.book),
            label: 'Meal Planning',
          )
      );
      items.add(
        BottomNavigationBarItem(
          icon: Icon(UniconsLine.bookmark),
          label: 'Saved',
        ),
      );
      items.add(
        BottomNavigationBarItem(
          icon: Icon(UniconsLine.user),
          label: 'Profile',
        )
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 4.0,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        selectedFontSize: 10.0.sp,
        iconSize: 18.sp,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).iconTheme.color,
        type: BottomNavigationBarType.fixed,
        items: items
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: <Widget>[
          Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              );
            },
          ),
          Navigator(
            key: categoryNavigatorKey,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              );
            },
          ),
          if (isLoggedIn) ...[
            Navigator(
              key: planningNavigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => const MealPlanningScreen(),
                );
              },
            ),
            Navigator(
              key: savedNavigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => const SavedScreen(),
                );
              },
            ),
            Navigator(
              key: profileNavigatorKey,
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
