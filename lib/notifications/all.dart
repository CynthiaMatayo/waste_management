import 'package:flutter/material.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Submission Received!",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Your waste submission (Submission ID:#78910) has been successfully received. You'll be notified once it's processed.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "2 mins ago",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Submission Details",
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Payment Received!",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "₦ 1000 has been added to your in-app wallet for your recent submission (Submission ID:#78910)",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "2 mins ago",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Submission Details",
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Pickup Reminder!",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Your pickup is scheduled for tomorrow at [Time]. Please have your waste ready.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "2 mins ago",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Submission Details",
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Pickup Scheduled!",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Your pickup has been scheduled for [Date and Time]. Please ensure your waste is ready for colection.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "2 mins ago",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Submission Details",
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
