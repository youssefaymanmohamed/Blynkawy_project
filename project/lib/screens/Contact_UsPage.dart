import 'package:flutter/material.dart';
import 'nav_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with background color
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      appBar: AppBar(
        // App bar with custom styling
        backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color.fromRGBO(65, 176, 110, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Contact Us',
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
            const SizedBox(height: 20),
            // Contact option for the first email
            buildContactOption(
              'youssefaymanmohamed1@gmail.com',
              Icons.email,
            ),
            const SizedBox(height: 20),
            // Contact option for the second email
            buildContactOption(
              'begadtamim.a@gmail.com',
              Icons.email,
            ),
            const SizedBox(height: 20),
            // Contact option for the first GitHub account
            buildContactOption(
              'youssefaymanmohamed',
              'assets/github icon.png',
            ),
            const SizedBox(height: 20),
            // Contact option for the second GitHub account
            buildContactOption(
              'begad-tamim',
              'assets/github icon.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      CustomBottomNavigationBar(context: context, selectedIndex: 2),
    );
  }

  // Widget for building each contact option
  Widget buildContactOption(String text, dynamic icon) {
    return Container(
      // Container with rounded corners and background color
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(141, 236, 180, 1),
      ),
      child: Center(
        child: ListTile(
          // ListTile to display icon and text
          leading: icon is IconData
              ? Icon(icon, color: Colors.black)
              : Image.asset(icon, color: Colors.black, width: 30, height: 40),
          title: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
