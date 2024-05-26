import 'package:flutter/material.dart';
import 'nav_bar.dart';

class ThirdPartiesScreen extends StatelessWidget {
  const ThirdPartiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(65, 167, 110, 4)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Color.fromRGBO(65, 167, 110, 4), size: 40),
            onPressed: () {
              // Handle add action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildOptionItem('Alexa', 'assets/alexa icon.png'),
                  _buildOptionItem('Google Assistant', 'assets/google assistant.png'),
                  _buildOptionItem('Siri', 'assets/siri icon.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(context: context, selectedIndex: 2),
    );
  }

  // Widget to build each option item
  Widget _buildOptionItem(String text, String iconPath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(141, 236, 180, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 50,
          color: const Color.fromRGBO(141, 236, 180, 1),
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        onTap: () {
          // Handle on tap
        },
      ),
    );
  }
}
