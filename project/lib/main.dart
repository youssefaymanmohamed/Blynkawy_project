import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/profile_Page.dart';
import 'package:project/screens/settingsPage.dart';
import 'package:project/screens/bedroom.dart';
import 'package:project/screens/bathroom.dart';
import 'package:project/screens/kitchen.dart';
import 'package:project/screens/livingroom.dart';
import './screens/homeScreen.dart';
import './screens/loginPage.dart';
import './screens/signup_page.dart';
import './screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/bedroom': (context) => const Bedroom(),
        '/bathroom': (context) => const Bathroom(),
        '/livingroom': (context) => const LivingRoom(),
        '/kitchen': (context) => const Kitchen(),
      },
    );
  }
}