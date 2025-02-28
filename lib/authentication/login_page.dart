import 'package:flutter/material.dart';
import 'package:waste_management/home_page.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/models/input_widget.dart';
import 'package:waste_management/authentication/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                image: AssetImage('lib/assets/images/login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                  //       // Handle back action
                  //     }
                  // ),
                  // Spacer(),
                  // ],
                  // ),
                  SizedBox(height: 20), //Space between arrow and input fields
                  Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 40), //Space between title and input fields

                  InputWidget(
                    isPassword: false,
                    controller: usernameController,
                    hint: "Username",
                    icon: Icons.person_outline,
                  ),
                  SizedBox(height: 16), //Space between input fields

                  // TextField(
                  //   controller: passwordController,
                  //   obscureText: true,
                  //   obscuringCharacter: "*",
                  //   decoration: InputDecoration(
                  //       prefixIcon: Icon(Icons.lock_outline),
                  //       hintText: "Password",
                  //       hintStyle: TextStyle(
                  //           color: Colors.grey, fontStyle: FontStyle.italic)),
                  // ),

                  InputWidget(
                      isPassword: true,
                      controller: passwordController,
                      hint: "Password",
                      icon: Icons.lock_outline),
                  SizedBox(height: 24), // Space before button
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // print(username_controller.text);
                          // print(password_controller.text);
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            print("Please enter both Username and Password");
                          } else {
                            if (usernameController.text == 'Cynthia' &&
                                passwordController.text == '123') {
                              print("Login Successful");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                              usernameController.clear();
                              passwordController.clear();
                            } else {
                              print("Incorrect Username or Password");
                              usernameController.clear();
                              passwordController.clear();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.cancel),
                                      ),
                                    ],
                                    content:
                                        Text("Incorrect Username or Password"),
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
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
                        "First time here?",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegistrationPage();
                            },
                          ));
                        },
                        child: Text(
                          "Sign Up.",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
