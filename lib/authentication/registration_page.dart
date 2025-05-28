import 'package:flutter/material.dart';
import 'package:waste_management/authentication/login_page.dart';
import 'package:waste_management/home_page.dart';
import 'package:waste_management/models/confirm_widget.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/models/extracted_widget.dart';
import 'package:waste_management/models/input_widget.dart';
import 'package:waste_management/api_service.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isLoading = false;

  // If controllers are not defined globally, add them here
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmController = TextEditingController();

  void _handleRegistration() async {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords don\'t match')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      bool success = await ApiService.register(
        usernameController.text.trim(),
        emailController.text.trim(),
        passwordController.text,
        confirmController.text,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                image: AssetImage('lib/assets/images/background.png'),
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
                        onPressed: _isLoading ? null : _handleRegistration,
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : SizedBox(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ));
                        },
                        child: Text(
                          "Log In.",
                          style: TextStyle(color: Colors.blue),
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
    );
  }
}
