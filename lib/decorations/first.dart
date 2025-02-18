import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/models/input_widget.dart';

class FirstDecor extends StatelessWidget {
  const FirstDecor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            // top container
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              height: MediaQuery.of(context).size.height / 3,
              child: Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(120),
                  ),
                ),
              )),
            ),

            // bottom container
            Container(
              height: MediaQuery.sizeOf(context).height * 2 / 3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120),
                ),
              ),
              child: Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 50.0,
                                bottom: 20,
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                          InputWidget(
                              controller: passwordController,
                              hint: "Userame",
                              icon: Icons.person,
                              isPassword: false),
                          InputWidget(
                              controller: passwordController,
                              hint: "Password",
                              icon: Icons.key,
                              isPassword: true),
                          InputWidget(
                              controller: passwordController,
                              hint: "Confirm Password",
                              icon: Icons.key,
                              isPassword: true),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
