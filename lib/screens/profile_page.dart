import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  File? _image;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _helloText = 'Hello, Blinkawy';

  @override
  void initState() {
    super.initState();
    _loadProfileInfo();
  }

  // Load profile information from SharedPreferences
  Future<void> _loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _image = File(prefs.getString('imagePath') ?? '');
      _nicknameController.text = prefs.getString('nickname') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _updateHelloText(); // Call function to update hello text
    });
  }

  // Update the hello text with the nickname
  void _updateHelloText() {
    setState(() {
      _helloText = 'Hello, ${_nicknameController.text}';
    });
  }

  // Save profile information to SharedPreferences
  Future<void> _saveProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', _image?.path ?? '');
    await prefs.setString('nickname', _nicknameController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('email', _emailController.text);
    _updateHelloText(); // Update hello text after saving
  }

  // Pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      bottomNavigationBar: CustomBottomNavigationBar(context: context, selectedIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color.fromRGBO(141, 236, 180, 1),
                        backgroundImage: _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? const Icon(
                          Icons.add,
                          color: Color.fromRGBO(65, 176, 110, 1),
                          size: 30,
                        )
                            : null,
                      ),
                    ),
                  ),
                  Text(
                    _helloText, // Display dynamic hello text
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(65, 176, 110, 1),
                      fontFamily: 'Bona Nova bold',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildTextField('Nickname', 'ex: "Blinkawy"', _nicknameController),
              const SizedBox(height: 20),
              buildTextField('Phone', 'ex: "+201234567890"', _phoneController),
              const SizedBox(height: 20),
              buildTextField('Email', '"Example@email.com"', _emailController),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Clear text fields and image
                          setState(() {
                            _image = null;
                            _nicknameController.clear();
                            _phoneController.clear();
                            _emailController.clear();
                            _helloText = 'Hello, Blinkawy';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(141, 236, 180, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Bona Nova',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await _saveProfileInfo();
                          // You can navigate to another screen or do something else after saving
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(65, 176, 110, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Bona Nova',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build text field widget
  Widget buildTextField(String label, String placeholder, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(65, 176, 110, 1),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(141, 236, 180, 1),
          ),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            onChanged: (_) => _updateHelloText(), // Update hello text when nickname changes
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.black,
              height: 3.5,
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
      ],
    );
  }
}
