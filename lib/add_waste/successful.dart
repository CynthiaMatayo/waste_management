import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class Successful extends StatelessWidget {
  const Successful({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: ClipOval(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 0, 79, 14),
                  child: Icon(
                    Icons.done_all_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Successful!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Your waste submission is confirmed",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 0, 79, 14)),
                  child: Center(
                      child: Text(
                    "Okay!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  )),
                ),
              )),
          TextButton(
            onPressed: () {
              bottomsheetpagecontroller.previousPage(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.decelerate);
            },
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Colors.green,
                ),
              ),
              child: Center(
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 79, 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
