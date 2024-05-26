import 'package:flutter/material.dart';
import 'nav_bar.dart';

class TermsAndPolicyScreen extends StatelessWidget {
  const TermsAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 245, 224, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF41B06E)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Terms & Policy',
          style: TextStyle(
            color: Color(0xFF41B06E),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF41B06E),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Terms and Policy text divided into sections
                Text(
                  '1. Acceptance of Terms\n\n'
                      'By accessing or using Blinkawy, you agree to abide by these terms and policies. If you do not agree with any part of these terms, you may not use our application.\n\n'
                      '2. Privacy Policy\n\n'
                      'Our Privacy Policy explains how we collect, use, and protect your personal information. By using our application, you consent to the collection and use of your data as described in our Privacy Policy.\n\n'
                      '3. Security Measures\n\n'
                      'We implement various security measures to protect your personal information and the security of your smart home devices. However, we cannot guarantee complete security against unauthorized access or misuse.\n\n'
                      '4. User Responsibilities\n\n'
                      'You are responsible for maintaining the security of your account credentials and for any activities that occur under your account. You must also comply with any usage guidelines provided by Blinkway.\n\n'
                      '5. Intellectual Property\n\n'
                      'All content and intellectual property associated with Blinkway are owned by us or our licensors. You may not use, reproduce, or distribute any content from our application without prior written permission.\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(context: context, selectedIndex: 2),
    );
  }
}
