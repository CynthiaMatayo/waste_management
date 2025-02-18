import 'package:flutter/material.dart';
import 'package:waste_management/add_waste/add_pickup.dart';
import 'package:waste_management/add_waste/add_pickupdate.dart';
import 'package:waste_management/add_waste/add_quantity.dart';
import 'package:waste_management/add_waste/add_type.dart';
import 'package:waste_management/add_waste/review_submission.dart';
import 'package:waste_management/add_waste/successful.dart';
import 'package:waste_management/history/my_earnings.dart';
import 'package:waste_management/history_page.dart';
import 'package:waste_management/models/bodytext.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/notifications.dart';
import 'package:waste_management/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    home(),
    HistoryPage(),
    Notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 229),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          pageController.jumpToPage(value);

          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _currentIndex,
      ),
    );
  }
}

class home extends StatelessWidget {
  const home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Cynthia!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "Good afternoon, how are you today?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Profile();
                      }),
                    );
                  },
                  child: ClipOval(
                    child: CircleAvatar(
                      child: Image.asset(
                        'lib/assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 14),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(3.0),
                margin: EdgeInsets.all(3.0),
                decoration: BoxDecoration(shape: BoxShape.rectangle),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 246, 251, 229),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: PageView(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: bottomsheetpagecontroller,
                                    children: [
                                      AddType(),
                                      AddQuantity(),
                                      AddPickup(),
                                      AddPickupdate(),
                                      ReviewSubmission(),
                                      Successful(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Color.fromARGB(255, 0, 79, 14)),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.white),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: Text(
                                'Add Waste ',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Submissions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HistoryPage();
                      },
                    ));
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 42, 77, 2),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  //margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            "Waste Type: ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Plastic",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          BodyText(text: "Submitted on: "),
                          BodyText(text: "Feb 3, 2025")
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          BodyText(text: "Quantity: "),
                          BodyText(text: "5kg"),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(children: [
                        BodyText(text: "Pickup Date/Time: "),
                        BodyText(text: "Feb 3, 2025, 8:00AM"),
                      ]),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          BodyText(text: "Payment Status: "),
                          Text(
                            "Pending",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BodyText(text: "Waste Submission Reference: "),
                          BodyText(text: "#123422"),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Notifications();
                            }));
                          },
                          style: ButtonStyle(),
                          child: Text(
                            "View Details",
                            style:
                                TextStyle(color: Colors.green, fontSize: 13.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Earnings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Scaffold(
                              backgroundColor:
                                  const Color.fromARGB(255, 246, 251, 229),
                              appBar: AppBar(
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 251, 229),
                                title: Text(
                                  "My Earnings",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                centerTitle: true,
                              ),
                              body: MyEarnings()));
                    }));
                  },
                  child: Text(
                    "View Earnings History",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 42, 77, 2)),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/images/background.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    color: const Color.fromARGB(255, 42, 77, 2),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "₦ 12000.00",
                                style: TextStyle(
                                    color: Colors.tealAccent[100],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Total Earnings",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Column(
                            children: [
                              Text(
                                "₦ 600.00",
                                style: TextStyle(
                                    color: Colors.amberAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Pending Payment",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "₦ 100.00",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Last Payment on Feb 3, 2025",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
