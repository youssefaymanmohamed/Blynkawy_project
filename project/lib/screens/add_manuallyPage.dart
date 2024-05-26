import 'package:flutter/material.dart';
import 'nav_bar.dart';

class AddManuallyPage extends StatelessWidget {
  const AddManuallyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with background color
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      appBar: AppBar(
        // App Bar with custom styling
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
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            'Add Manually',
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
            buildTextField('IP-Address', 'IP-Address'), // IP Address text field
            const SizedBox(height: 20),
            buildTextField('Name', 'Name'), // Name text field
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle cancel action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(141, 236, 180, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                // Increase the width to move the buttons away from each other
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(65, 176, 110, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: CustomBottomNavigationBar(context: context, selectedIndex: 0),
    );
  }

  // Function to build a text field with a label and placeholder
  Widget buildTextField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromRGBO(141, 236, 180, 1),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Colors.black,
                height: 1,
              ),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Inter',
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
