import 'package:flutter/material.dart';
import 'package:meal_planning_recipie_planning_app/screens/account_screen.dart';
import 'package:meal_planning_recipie_planning_app/screens/login_page.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import '/widgets/widgets.dart';
import 'account_screen.dart';
import 'app_info_screen.dart';
import 'logout_screen.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.0.h,
              ),
              Text(
                'Profile',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 4.0.h,
              ),
              const ProfileHeader(),
              const ProfileListView()
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: [
            ProfileListTile(
              text: 'Account',
              icon: UniconsLine.user_circle,
              screenToNavigate: AccountScreen(),
            ),
            Divider(
              color: Colors.grey.shade400,
              indent: 10.0,
              endIndent: 10.0,
            ),
            ProfileListTile(
              text: 'Settings',
              icon: UniconsLine.setting,
              screenToNavigate: SettingsScreen(),
            ),
            Divider(
              color: Colors.grey.shade400,
              indent: 10.0,
              endIndent: 10.0,
            ),
            ProfileListTile(
              text: 'App Info',
              icon: UniconsLine.info_circle,
              screenToNavigate: AppInfoScreen(),
            ),
            Divider(
              color: Colors.grey.shade400,
              indent: 10.0,
              endIndent: 10.0,
            ),
              ListTile(
                title: Text('Logout', style: Theme.of(context).textTheme.headline5),
                horizontalTitleGap: 5.0,
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(UniconsLine.sign_out_alt, color: Theme.of(context).iconTheme.color),
                ),
                trailing: Icon(
                  UniconsLine.angle_right,
                  size: 24.0.sp,
                  color: Theme.of(context).iconTheme.color,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
              })
          ]),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget screenToNavigate; // The screen to navigate to when tapped
  const ProfileListTile(
      {Key? key,
      required this.text,
      required this.icon,
      required this.screenToNavigate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(text, style: Theme.of(context).textTheme.headline5),
        horizontalTitleGap: 5.0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(icon, color: Theme.of(context).iconTheme.color),
        ),
        trailing: Icon(
          UniconsLine.angle_right,
          size: 24.0.sp,
          color: Theme.of(context).iconTheme.color,
        ),
        onTap: () {
          // Navigate to the specified screen when the item is tapped.
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screenToNavigate,
              ));
        });
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImage(
            height: 20.0.h,
            image:
                'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1740&q=80'),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Username',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 5.0,
        ),
    
      ],
    );
  }
}
