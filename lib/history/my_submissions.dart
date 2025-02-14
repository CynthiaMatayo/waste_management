import 'package:flutter/material.dart';

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
                          Text("Waste Type: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Plastic",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Submitted on: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Feb 3, 2025",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Waste Submission Reference: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("#123422",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Quantity: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("5kg",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Pickup Date/Time: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Feb 3, 2025",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Payment Status: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
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
                        Text("Waste Type: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("Plastic",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ]),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Submitted on: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Feb 3, 2025",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Waste Submission Reference: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("#123422",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Quantity: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("5kg",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Pickup Date/Time: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Feb 3, 2025",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Payment Status: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
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
                      SizedBox(height: 2),
                      Row(children: [
                        Text("Waste Type: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("Plastic",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ]),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Submitted on: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Feb 3, 2025",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Waste Submission Reference: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("#123422",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Quantity: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("5kg",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Pickup Date/Time: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Feb 3, 2025",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Payment Status: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
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
