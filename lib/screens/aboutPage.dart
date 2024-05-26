import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './homeScreen.dart';
import './profile_Page.dart';
import './settingsPage.dart';

// Define a StatefulWidget for the AboutPage
class AboutPage extends StatefulWidget {
  // Constructor for AboutPage widget
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

// Define the state for the AboutPage
class _AboutPageState extends State<AboutPage> {
  // Variable to hold the user's rating
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      appBar: AppBar(
        // App Bar properties
        backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
        elevation: 0,
        leading: IconButton(
          // Back button
          icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(65, 176, 110, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Padding(
          // Title text
          padding: EdgeInsets.only(top: 40),
          child: Text(
            'About',
            style: TextStyle(
              color: Color.fromRGBO(65, 176, 110, 1),
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Build the rating box
            buildBox(
              'Rate Us',
              Row(
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = index + 1;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            // Build the version box
            buildBox(
              'Current Version',
              const Text(
                '1.1.2',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        index: 2, // Set this to the index of the settings page
        backgroundColor: const Color(0xFFFFF5E0),
        color: const Color(0xFF41B06E),
        items: const <Widget>[
          Icon(Icons.home_rounded, size: 30),
          Icon(Icons.person_rounded, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          // Handle navigation on tap
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          }
        },
      ),
    );
  }

  // Function to build the box with text and trailing widget
  Widget buildBox(String text, Widget trailing) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(141, 236, 180, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: trailing,
          ),
        ],
      ),
    );
  }
}
