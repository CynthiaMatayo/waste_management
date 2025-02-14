import 'package:flutter/material.dart';
import 'package:waste_management/add_waste/track_pickup.dart';

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
                        Text("Waste Type(s): ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("Irons/Plastics",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Quantity: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("45kg",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Pickup Date/Time: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("February 4, 2025, 8:00AM",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Pickup Location: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("19 Awolowo Avenue, Ibadan 200285,",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        "Oyo, Nigeria",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Payment Status: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
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
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Waste Type(s): ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("Irons/Plastics",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Quantity: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("45kg",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Pickup Date/Time: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("February 4, 2025, 8:00AM",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Pickup Location: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("19 Awolowo Avenue, Ibadan 200285,",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                        textAlign: TextAlign.start,
                        "Oyo, Nigeria",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text("Payment Status: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        Text("Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    SizedBox(
                      height: 2,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TrackPickup();
                                  },
                                ),
                              );
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
                        Divider(),
                      ],
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
