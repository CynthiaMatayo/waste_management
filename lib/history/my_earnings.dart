import 'package:flutter/material.dart';

class MyEarnings extends StatefulWidget {
  const MyEarnings({super.key});

  @override
  State<MyEarnings> createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Payment Date/Time: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("February 4, 2025, 8:00AM",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Amount: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("₦ 25,000",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Payment Method: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Mobile Transfer",
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
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Details",
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text("Payment Date/Time: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("February 4, 2025, 8:00AM",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Amount: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("₦ 25,000",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Payment Method: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Mobile Transfer",
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
                            "Paid",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
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
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Details",
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text("Payment Date/Time: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("February 4, 2025, 8:00AM",
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Amount: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("₦ 25,000",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text("Payment Method: ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          Text("Mobile Transfer",
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
                            "Failed",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
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
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Details",
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        ),
                      ),
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
