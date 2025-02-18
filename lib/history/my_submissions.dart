import 'package:flutter/material.dart';
import 'package:waste_management/models/bodytext.dart';

class MySubmissions extends StatefulWidget {
  const MySubmissions({super.key});

  @override
  State<MySubmissions> createState() => _MySubmissionsState();
}

class _MySubmissionsState extends State<MySubmissions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          BodyText(text: "Waste Type: "),
                          BodyText(text: "Plastic"),
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Submitted on: "),
                          BodyText(text: "Feb 3, 2025"),
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422"),
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Quantity: "),
                          BodyText(text: "5kg")
                        ],
                      ),

                      Row(
                        children: [
                          BodyText(text: "Pickup Date/Time: "),
                          BodyText(text: "Feb 3, 2025")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Status: "),
                          Text(
                            "Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "View Details",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 12),
                            )),
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        BodyText(text: "Waste Type: "),
                        BodyText(text: "Plastic")
                      ]),
                      Row(
                        children: [
                          BodyText(text: "Submitted on: "),
                          BodyText(text: "Feb 3, 2025")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Quantity: "),
                          BodyText(text: "5kg")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Pickup Date/Time: "),
                          BodyText(text: "Feb 3, 2025")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Status: "),
                          Text(
                            "Completed",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "View Details",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 12),
                            )),
                      ),
                      Divider(),
                      Row(children: [
                        BodyText(text: "Waste Type: "),
                        BodyText(text: "Plastic")
                      ]),
                      Row(
                        children: [
                          BodyText(text: "Submitted on: "),
                          BodyText(text: "Feb 3, 2025")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Quantity: "),
                          BodyText(text: "5kg")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Pickup Date/Time: "),
                          BodyText(text: "Feb 3, 2025")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Status: "),
                          Text(
                            "Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "View Details",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 12),
                            )),
                      ),
                      //Divider(),
                    ],
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
