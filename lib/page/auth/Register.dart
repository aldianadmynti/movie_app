import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../injection_container.dart';
import '../../service/firebase_auth_service.dart';
import '../../nav_bar.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = sl();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User is successfully created"),
          backgroundColor: Color.fromARGB(255, 167, 202, 222),
        ),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Navbar()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 202, 222),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   backgroundImage: AssetImage("images/travel.png"),
              //   backgroundColor: Color.fromARGB(255, 167, 202, 222),
              //   radius: 100,
              // ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Register",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    register();
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 167, 202, 222)),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already has an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      "Login.",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
