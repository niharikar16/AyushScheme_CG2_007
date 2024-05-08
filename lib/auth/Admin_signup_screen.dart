import 'dart:developer';
import 'package:logintry/auth/Admin_login_screen.dart';
// import 'package:logintry/auth/User_login_screen.dart';

import 'auth_service.dart';
// import 'login_screen.dart';
import 'package:logintry/home_screen.dart';
import 'package:logintry/widgets/button.dart';
import 'package:logintry/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({super.key});

  @override
  State<AdminSignup> createState() => AdminSignupState();
}

class AdminSignupState extends State<AdminSignup> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _isLoading = false; // Track loading state

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),
              const Text("Signup as Admin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hint: "Enter Name",
                label: "Name",
                controller: _name,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "length must be more than 5",
                label: "Password",
                isPassword: true,
                controller: _password,
              ),
              const SizedBox(height: 30),
              _isLoading
                  ? CircularProgressIndicator(
                      color: Colors.blueGrey,
                    ) // Show CircularProgressIndicator if loading
                  : CustomButton(
                      label: "Signup",
                      onPressed: _signup,
                    ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  InkWell(
                    onTap: () => goToLogin(context),
                    child: const Text("Login",
                        style: TextStyle(color: Colors.blue)),
                  )
                ],
              ),
              const Spacer()
            ],
          ),
        ),

    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminLogin()),
      );

  _signup() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Created Successfully");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User created successfully'),
        ),
      );

      goToLogin(context);
    }
  }

  goToHome(BuildContext context) async {
    // Delay navigation to simulate a loading process
    await Future.delayed(
        Duration(seconds: 2)); // You can adjust the duration as needed

    setState(() {
      _isLoading = false; // Hide loading indicator
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
