import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class AddType extends StatefulWidget {
  const AddType({super.key});

  @override
  State<AddType> createState() => _AddTypeState();
}

class _AddTypeState extends State<AddType> {
  final Map<String, String> wastes = {
    "E-Waste": "lib/assets/images/E-Waste.png",
    "Plastic": "lib/assets/images/plastic wastes.png",
    "Papers": "lib/assets/images/paper wastes.png",
    "Metals": "lib/assets/images/metal wastes.png",
    "Glasses": "lib/assets/images/glass wastes.png",
    "Others": "lib/assets/images/other wastes.png",
  };

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
                  "Add waste type",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "What are you disposing today?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: wastes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                var waste = wastes.entries.toList()[index];

                return Column(
                  children: [
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(2),
                        width: 60, // Ensure a proper size for images
                        height: 60,
                        color: const Color.fromARGB(176, 125, 239, 239),
                        child: Image.asset(
                          waste.value,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(waste.key, style: TextStyle(fontSize: 14)),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20),
          TextButton(
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
        ],
      ),
    );
  }
}
