import 'dart:developer';
import 'auth_service.dart';
import 'signup_screen.dart';
import 'package:logintry/home_screen.dart';
import 'package:logintry/widgets/button.dart';
import 'package:logintry/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.black), // Adjust text style
            ),
            const SizedBox(height: 50),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Login",
              onPressed: _login,
              // color: Colors.purple, // Change button color
              // textColor: Colors.white, // Change text color
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                InkWell(
                  onTap: () => goToSignup(context),
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold), // Adjust text style
                  ),
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}
