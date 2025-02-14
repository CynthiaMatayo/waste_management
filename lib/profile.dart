import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 251, 229),
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Wallet",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: const Color.fromARGB(255, 42, 77, 2),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Available Balance",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_outlined),
                          color: Colors.white,
                          iconSize: 18,
                        ),
                        Text(
                          "View Transaction History",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                          color: Colors.white,
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("₦ 12000.00",
                            style: TextStyle(
                                color: Colors.tealAccent[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            height: 32,
                            width: 120,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 67, 132, 70),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: Center(
                                child: Text(
                              "Withdraw Fund",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                height: 430,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(Icons.account_circle_outlined),
                          title: Text(
                            "Profile Details",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.place_outlined),
                          title: Text(
                            "Addresses",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.red)),
                                child: Badge.count(
                                  count: 5,
                                  textColor: Colors.red,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Icon(Icons.chevron_right)
                            ],
                          ),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.account_balance_outlined),
                          title: Text(
                            "Bank Balance Settings",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.settings_outlined),
                          title: Text(
                            "Password Settings",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            "Contact Support",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            print("Contacting Support");
                          },
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.logout),
                            color: Colors.red,
                            iconSize: 24,
                          ),
                          title: Text(
                            "Sign Out",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 18),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            print("Signing Out...");
                          },
                        ),
                      ],
                    )),
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
