import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class AddPickupdate extends StatefulWidget {
  const AddPickupdate({super.key});

  @override
  State<AddPickupdate> createState() => _AddPickupdateState();
}

class _AddPickupdateState extends State<AddPickupdate> {
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
                Text(
                  "Add pickup Date & Time",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "What time date & should we pick up your waste?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Center(
            child: Text(
              "Pickup Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Center(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.green,
                      )),
                  Text(
                    "Tuesday, 4 February",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right,
                        color: Colors.green,
                      ))
                ],
              ),
            ),
          ),
          Text(
            "Available Pickup Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 100),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            color: const Color.fromARGB(255, 145, 141, 141)),
                      ),
                      child: Center(
                          child: Text(
                        "9:00 AM",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ],
                );
              },
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
