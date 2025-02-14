import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class AddPickup extends StatefulWidget {
  const AddPickup({super.key});

  @override
  State<AddPickup> createState() => _AddPickupState();
}

class _AddPickupState extends State<AddPickup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Pickup Location",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "Where should we pickup your waste?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 230, 227, 227),
                  prefixIcon: Icon(Icons.place_outlined),
                  hintText: "Enter a new address"),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.near_me_rounded),
                    iconSize: 30,
                    color: Colors.green,
                    style: ButtonStyle(),
                  ),
                  Text(
                    "Use your current location",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(179, 232, 223, 223))),
                  hintText: "19 Awolowo Avenue, Ibadan 200285,Oyo, Nigeria",
                  hintStyle: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(179, 232, 223, 223))),
                  hintText: "Coca house Ibadan, Nigeria, Oyo",
                  hintStyle: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(179, 232, 223, 223))),
                  hintText: "Soka road Ibadan, Oyo",
                  hintStyle: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                bottomsheetpagecontroller.nextPage(
                    duration: Duration(milliseconds: 10), curve: Curves.linear);
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(255, 0, 79, 14),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                bottomsheetpagecontroller.previousPage(
                    duration: Duration(milliseconds: 10),
                    curve: Curves.decelerate);
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightGreen),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white54,
                ),
                child: Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 79, 14),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
