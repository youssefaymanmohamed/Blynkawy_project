import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigate back when the back button is pressed
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 150,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 245, 224, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              const Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Bona Nova bold',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              const SizedBox(height: 60),
              _buildTextField('Email', const Color.fromRGBO(141, 236, 180, 1), emailController), // Build text field for email
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(20, 30, 70, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Send Reset Password Email',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Bona Nova',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text); // Send reset password email
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Reset password link has been sent to your email'), // Show success message
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error occurred while sending reset password email'), // Show error message
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build text field widget
  Widget _buildTextField(String hintText, Color color, TextEditingController controller) {
    return Container(
      width: 360,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Bona Nova',
          fontSize: 25,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
