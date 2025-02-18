import 'package:flutter/material.dart';
import 'package:waste_management/add_waste/track_pickup.dart';
import 'package:waste_management/models/bodytext.dart';

class MyNextPickup extends StatefulWidget {
  const MyNextPickup({super.key});

  @override
  State<MyNextPickup> createState() => _MyNextPickupState();
}

class _MyNextPickupState extends State<MyNextPickup> {
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BodyText(text: "Waste Type(s): "),
                        BodyText(text: "Irons/Plastics")
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Quantity: "),
                        BodyText(text: "45kg")
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Pickup Date/Time: "),
                        BodyText(text: "February 4, 2025, 8:00AM")
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Pickup Location: "),
                        BodyText(text: "Kenyatta Avenue, Nakuru Kenya"),
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Payment Status: "),
                        Text("Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Container(
                                height: 38,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                      255,
                                      0,
                                      79,
                                      14,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    "Edit Pickup",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return TrackPickup();
                                  },
                                ));
                              },
                              child: Container(
                                height: 38,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    "Track Pickup",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 79, 14),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        BodyText(text: "Waste Type(s): "),
                        BodyText(text: "Irons/Plastics")
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Quantity: "),
                        BodyText(text: "45kg")
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Pickup Date/Time: "),
                        BodyText(text: "February 4, 2025, 8:00AM")
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Pickup Location: "),
                        BodyText(text: "Kenyatta Avenue, Nakuru, Kenya"),
                      ],
                    ),
                    Row(
                      children: [
                        BodyText(text: "Payment Status: "),
                        Text("Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Container(
                                height: 38,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(
                                      255,
                                      0,
                                      79,
                                      14,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    "Edit Pickup",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return TrackPickup();
                                  },
                                ));
                              },
                              child: Container(
                                height: 38,
                                width: 120,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Center(
                                  child: Text(
                                    "Track Pickup",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 79, 14),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
