import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Services/auth_service.dart';
import './loginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 245, 224, 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 510,
                child: Lottie.asset(
                  'assets/Animation - 1716295277755.json',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: double.infinity,
                height: 443,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Color.fromRGBO(65, 176, 110, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      const Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Bona Nova bold',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField('Username', const Color.fromRGBO(141, 236, 180, 1), usernameController),
                      const SizedBox(height: 20),
                      _buildTextField('Email', const Color.fromRGBO(141, 236, 180, 1), emailController),
                      const SizedBox(height: 20),
                      _buildTextField('Password', const Color.fromRGBO(141, 236, 180, 1), passwordController, isPassword: true),
                      const SizedBox(height: 20),
                      _buildSignupButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, Color color, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      width: 350,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          )
              : null,
        ),
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Bona Nova',
          fontSize: 25,
          fontWeight: FontWeight.normal,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        dynamic result = await _auth.registerWithEmailAndPassword(emailController.text, passwordController.text);
        if (result == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not sign up with those credentials'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          if (kDebugMode) {
            print('Signed up');
          }
          if (kDebugMode) {
            print(result.uid);
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      },
      child: Container(
        width: 200,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(20, 30, 70, 1),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Sign up',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Bona Nova',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ),
    );
  }
}
