import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class TrackPickup extends StatefulWidget {
  const TrackPickup({super.key});

  @override
  State<TrackPickup> createState() => _TrackPickupState();
}

class _TrackPickupState extends State<TrackPickup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 251, 229),
        title: Text(
          "Track Pickup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 246, 251, 229),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: PageView(
                          controller: bottomsheetpagecontroller,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "En-route ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.local_shipping_rounded,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pickup vehicle will arrive in ",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "10 minutes",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Pickup Details",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Waste Type(s): ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Plastic",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Submitted on: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "February 5, 2025",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Quantity: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "5kg",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Pickup Date/Time: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "February 5, 2025, 8:00AM",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            height: 38,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 0, 79, 14),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Center(
                                                child: Text(
                                              "Cancel Pickup",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            )),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            height: 38,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                border: Border.all(
                                                    color: Colors.green)),
                                            child: Center(
                                              child: Text(
                                                "Contact Support",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 0, 79, 14),
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.local_shipping_outlined,
                  size: 30,
                  color: Color.fromARGB(255, 0, 79, 14),
                ),
                label: Text(
                  "Track",
                  style: TextStyle(fontSize: 15, color: Colors.green),
                )),
          ],
        ),
      ),
    );
  }
}
