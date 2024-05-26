import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/profile_Page.dart';
import 'package:project/screens/settingsPage.dart';

import 'homeScreen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BuildContext context;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.context,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: selectedIndex,
      backgroundColor: const Color(0xFFFFF5E0),
      color: const Color(0xFF41B06E),
      items: const <Widget>[
        Icon(Icons.home_rounded, size: 30), // Icon for home
        Icon(Icons.person_rounded, size: 30), // Icon for profile
        Icon(Icons.settings, size: 30), // Icon for settings
      ],
      onTap: (index) {
        if (index == 0) {
          // Navigate to Home page
          Navigator.of(context).pushReplacement(createRoute(const HomePage()));
        }
        if (index == 1) {
          // Navigate to Profile page
          Navigator.of(context).pushReplacement(createRoute(const ProfilePage()));
        }
        if (index == 2) {
          // Navigate to Settings page
          Navigator.of(context).pushReplacement(createRoute(const SettingsPage()));
        }
      },
    );
  }

  // Function to create custom page route with slide transition
  Route createRoute(Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
