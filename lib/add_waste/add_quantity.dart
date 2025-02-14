import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class AddQuantity extends StatefulWidget {
  const AddQuantity({super.key});

  @override
  State<AddQuantity> createState() => _AddQuantityState();
}

class _AddQuantityState extends State<AddQuantity> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Waste Quantity",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ],
            ),
          ),
          Center(
            child: Text(
              "How much waste are you disposing?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          // TextButton(
          //   onPressed: () {},
          // child: Container(
          //   decoration: BoxDecoration(

          //   ),
          // ),
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     filled: true,
          //     fillColor: Colors.white54,
          //     border: InputBorder.none,
          //     prefixIcon: Icon(
          //       Icons.scale,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your waste weight(in kg) ",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.scale),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Waste must be within the range 10kg-100kg"),
          ),
          Row(
            children: [
              Checkbox(
                  value: checked,
                  activeColor: Colors.green,
                  onChanged: (check) {
                    setState(() {
                      checked = check!;
                    });
                  }),
              Text(
                "Don't Know",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "₦",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  hintText: "Estimated Amount",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Amount is estimated based on weight and quantity"),
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
