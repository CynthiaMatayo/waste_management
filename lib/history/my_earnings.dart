import 'package:flutter/material.dart';
import 'package:waste_management/models/bodytext.dart';

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
                          BodyText(text: "Payment Date/Time: "),
                          BodyText(text: "February 4, 2025, 8:00AM")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Amount: "),
                          BodyText(text: "₦ 25,000")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Method: "),
                          BodyText(text: "Mobile Transfer")
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
                      SizedBox(height: 2),
                      Row(
                        children: [
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422"),
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
                          BodyText(text: "Payment Date/Time: "),
                          BodyText(text: "February 4, 2025, 8:00AM")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "February 4, 2025, 8:00AM"),
                          BodyText(text: "₦ 25,000")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Method: "),
                          BodyText(text: "Mobile Transfer")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Status: "),
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
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422")
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
                          BodyText(text: "Payment Date/Time: "),
                          BodyText(text: "February 4, 2025, 8:00AM")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Amount: "),
                          BodyText(text: "₦ 25,000")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Method: "),
                          BodyText(text: "Mobile Transfer")
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Payment Status: "),
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
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422"),
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
