import 'package:flutter/material.dart';
import 'package:waste_management/home_page.dart';
import 'package:waste_management/models/confirm_widget.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/models/extracted_widget.dart';
import 'package:waste_management/models/input_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/backgroung.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  InputWidget(
                    isPassword: false,
                    controller: usernameController,
                    hint: "Username",
                    icon: Icons.person_outline,
                  ),
                  SizedBox(height: 15),
                  ExtractedWidget(
                      controller: emailController,
                      hint: "Email",
                      icon: Icons.mail_outline),
                  SizedBox(height: 15),
                  InputWidget(
                      isPassword: true,
                      controller: passwordController,
                      hint: "Password",
                      icon: Icons.lock_outline),
                  SizedBox(height: 15),
                  ConfirmWidget(
                      isConfirm: true,
                      controller: confirmController,
                      hint: 'Confirm Password',
                      icon: Icons.lock_outline),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 4),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (usernameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              confirmController.text.isEmpty) {
                            print("All fields are required. ");
                          } else {
                            if (passwordController.text !=
                                confirmController.text) {
                              print("Passwords don't match.");
                            } else {
                              print("Sign Up Successful!");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          }
                        },
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
