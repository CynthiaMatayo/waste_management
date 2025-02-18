import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 251, 229),
        title: Text(
          "Address",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 230, 227, 227),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    prefixIcon: Icon(Icons.place_outlined),
                    hintText: "Add a new address"),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                ),
                height: 300,
                width: 500,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        ListTile(
                          title: Text(
                            "19 Awolowo Avenue, Ibadan 200285, Oyo, Nigeria",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: const Color.fromARGB(
                                            255, 246, 251, 229),
                                      ),
                                      child: PageView(
                                        controller: bottomsheetpagecontroller,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Delete Address?",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Are you sure you want  to delete 19 Awolowo Avenue, Ibadan 200285, Oyo, Nigeria?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Container(
                                                      height: 40,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Container(
                                                      height: 40,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          border: Border.all(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    79,
                                                                    14),
                                                          )),
                                                      child: Center(
                                                        child: Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      79,
                                                                      14),
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete_outline_outlined,
                                  color: Colors.red)),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "Coca house Ibadan, Nigeria, Oyo",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline_outlined,
                                  color: Colors.red)),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "Soka road Ibadan, Oyo",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline_outlined,
                                  color: Colors.red)),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "19 Awolowo Avenue, Ibadan 200285, Oyo, Nigeria",
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline_outlined,
                                  color: Colors.red)),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
