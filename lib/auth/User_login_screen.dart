import 'dart:developer';
import 'auth_service.dart';
// import 'signup_screen.dart';
import 'package:logintry/home_screen.dart';
import 'package:logintry/widgets/button.dart';
import 'package:logintry/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:logintry/auth/User_signup_screen.dart';
// import 'package:logintry/auth/User_signup_screen.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => UserLoginState();
}

class UserLoginState extends State<UserLogin> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;

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
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 80,
                ),
              )),
              const SizedBox(height: 30),
              // const Spacer(),
              const Text(
                "Login as User",
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
                isPassword: true,
                controller: _password,
              ),
              const SizedBox(height: 30),
              _isLoading
                  ? CircularProgressIndicator(
                      color: Colors.blueGrey,
                    ) // Show CircularProgressIndicator if loading
                  : CustomButton(
                      label: "Login",
                      onPressed: _login,
                    ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New User? "),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.blue,
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
        MaterialPageRoute(builder: (context) => const UserSignup()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  _login() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid Email or Password. Please try again!'),
        duration: Duration(seconds: 3),
      ));
    }
    setState(() {
      _isLoading = false;
    });
  }
}
