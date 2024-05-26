import 'package:flutter/material.dart';
import './aboutPage.dart';
import './profile_page.dart';
import './termspage.dart';
import './third_PartiesPage.dart';
import './welcome_page.dart';
import './Contact_UsPage.dart';
import 'nav_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1), // Set the background color here
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(65, 176, 110, 1)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF41B06E),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Color.fromRGBO(65, 176, 110, 1)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(
          children: const <Widget>[
            // Settings items with their titles and destinations
            SettingsItem(
              title: 'Personal Information',
              destination: ProfilePage(),
            ),
            SettingsItem(
              title: 'Third-Party Services',
              destination: ThirdPartiesScreen(),
            ),
            SettingsItem(
              title: 'About',
              destination: AboutPage(),
            ),
            SettingsItem(
              title: 'Contact Us',
              destination: ContactUsPage(),
            ),
            SettingsItem(
              title: 'Terms & Policy',
              destination: TermsAndPolicyScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(context: context, selectedIndex: 2),
    );
  }
}

// Widget for each individual setting item
class SettingsItem extends StatelessWidget {
  final String title;
  final Widget destination;

  const SettingsItem({super.key, required this.title, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF94E9BE),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
        ),
      ),
    );
  }
}

