import 'package:flutter/material.dart';
import 'package:waste_management/notifications/all.dart';
import 'package:waste_management/notifications/payments.dart';
import 'package:waste_management/notifications/pickup.dart';
import 'package:waste_management/notifications/submissions.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 251, 229),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 246, 251, 229),
          title: Text(
            "Notifications",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Submissions",
              ),
              Tab(
                text: "Pickup",
              ),
              Tab(
                text: "Payments",
              ),
            ]),
            Expanded(
                child: TabBarView(
                    children: [All(), Submissions(), Pickup(), Payments()]))
          ],
        ),
      ),
    );
  }
}
