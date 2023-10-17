// import 'package:flutter/material.dart';
// import '/screens/screens.dart';
// import 'package:sizer/sizer.dart';
// import 'package:unicons/unicons.dart';

// class CustomNavBar extends StatefulWidget {
//   const CustomNavBar({Key? key}) : super(key: key);

//   @override
//   _CustomNavBarState createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<CustomNavBar>
//     with SingleTickerProviderStateMixin {
//   int selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   static List<Widget> pages = [
//     const HomeScreen(),
//     const CategoryScreen(),
//     const SavedScreen(),
//     const ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         elevation: 4.0,
//         currentIndex: selectedIndex,
//         onTap: _onItemTapped,
//         showSelectedLabels: true,
//         selectedFontSize: 10.0.sp,
//         iconSize: 18.sp,
//         showUnselectedLabels: true,
//         selectedItemColor: Theme.of(context).iconTheme.color,
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(UniconsLine.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(UniconsLine.apps),
//             label: 'Category',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(UniconsLine.bookmark),
//             label: 'Saved',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(UniconsLine.user),
//             label: 'Profile',
//           ),
//         ],
//       ),
//       body: pages.elementAt(selectedIndex),
//     );
//   }
// }
import 'package:flutter/material.dart';
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
  final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.apps),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.user),
            label: 'Profile',
          ),
        ],
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
      ),
    );
  }
}
