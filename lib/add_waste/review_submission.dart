import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class ReviewSubmission extends StatelessWidget {
  const ReviewSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Review your Submission",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Waste Type: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                      Text(
                        "Plastic",
                        style: TextStyle(fontSize: 14.5),
                      )
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "Weight: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                      Text(
                        "5Kg",
                        style: TextStyle(fontSize: 14.5),
                      )
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "Pickup Location: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                      Text(
                        "19 Awolowo Avenue, Ibadan 200285,",
                        style: TextStyle(fontSize: 14.5),
                      )
                    ],
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "Oyo, Nigeria",
                    style: TextStyle(fontSize: 14.5),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "Pickup Date/Time: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                      Text(
                        "Feb 3, 2025, 8:00AM",
                        style: TextStyle(fontSize: 14.5),
                      )
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        "Estimated Amount: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                      Text(
                        "₦ 5000",
                        style: TextStyle(fontSize: 14.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  bottomsheetpagecontroller.nextPage(
                      duration: Duration(milliseconds: 10),
                      curve: Curves.linear);
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color.fromARGB(255, 0, 79, 14)),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                )),
          ),
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
                    border: Border.all(color: Colors.lightGreen)),
                child: Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 79, 14),
                        fontSize: 18),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
