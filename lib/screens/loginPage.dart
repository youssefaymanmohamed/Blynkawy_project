import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/screens/signup_page.dart';
import './homeScreen.dart';
import 'package:project/Services/auth_service.dart';
import './reset_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 245, 224, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 450,
                height: 290,
                child: Lottie.asset(
                  'assets/Animation - 1716295277755.json',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 485,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        'Log In',
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
                      _buildTextField('Email', const Color.fromRGBO(141, 236, 180, 1), emailController),
                      const SizedBox(height: 20),
                      _buildPasswordTextField('Password', const Color.fromRGBO(141, 236, 180, 1), passwordController),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                              );
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Bona Nova',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _buildLoginButton(context),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(141, 236, 180, 1),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Color.fromRGBO(141, 236, 180, 1),
                                fontFamily: 'Bona Nova',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                height: 0.5,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(141, 236, 180, 1),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildSocialButtons(context),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Bona Nova',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Bona Nova bold',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildTextField(String hintText, Color color, TextEditingController controller) {
    return Container(
      width: 360,
      height: 72,
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

  Widget _buildPasswordTextField(String hintText, Color color, TextEditingController controller) {
    return Container(
      width: 360,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        obscureText: !_passwordVisible,
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
        onTap: () async {
      dynamic result = await _auth.signInWithEmailAndPassword(emailController.text, passwordController.text);
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
            content: Text('Could not sign in with those credentials'),
              backgroundColor: Colors.red,
            ),
        );
      } else {
        if (kDebugMode) {
          print('Signed in');
        }
        if (kDebugMode) {
          print(result.uid);
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
        },
      child: Container(
        width: 128,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(20, 30, 70, 1),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Bona Nova',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform.translate(
          offset: const Offset(0, 10),
          child: GestureDetector(
            onTap: () async {
              dynamic result = await _auth.signInWithGoogle();
              if (result == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Could not sign in with Google'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                if (kDebugMode) {
                  print('Signed in with Google');
                }
                if (kDebugMode) {
                  print(result.user!.uid);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }
            },
            child: Container(
              width: 45,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/google icon.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        // Add more social buttons here if needed
      ],
    );
  }
}