import 'package:flutter/material.dart';
import 'package:waste_management/history/my_earnings.dart';
import 'package:waste_management/history/my_next_pickup.dart';
import 'package:waste_management/history/my_submissions.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 251, 229),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 246, 251, 229),
          title: Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 58,
                    width: 280,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                borderSide: BorderSide.none),
                            hintText: "Search History...",
                            hintStyle: TextStyle(fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor:
                                const Color.fromARGB(179, 232, 223, 223)),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 58,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(179, 232, 223, 223),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                borderSide: BorderSide.none),
                            prefixIcon: IconButton(
                              onPressed: () {},

                              // Icons.filter_alt_outlined,
                              icon: Icon(
                                Icons.filter_alt_outlined,
                              ),
                              iconSize: 39,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            TabBar(tabs: [
              Tab(
                text: "My Submissions",
              ),
              Tab(
                text: "My Earnings",
              ),
              Tab(
                text: "My Next Pickups",
              ),
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  MySubmissions(),
                  MyEarnings(),
                  MyNextPickup(),

                  // Center(child: Text("Tab 1 Content")),
                  // Center(child: Text("Tab 2 Content")),
                  // Center(child: Text("Tab 3 Content")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//            Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: myTabs.length,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: const TabBar(
//             tabs: myTabs,
//           ),
//         ),
//         body: TabBarView(
//           children: myTabs.map((Tab tab) {
//             final String label = tab.text!.toLowerCase();
//             return Center(
//               child: Text(
//                 'This is the $label tab',
//                 style: const TextStyle(fontSize: 36),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
