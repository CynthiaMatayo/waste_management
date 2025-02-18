import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/withdraw/withdrawal_failed.dart';

class Confirm extends StatefulWidget {
  const Confirm({super.key});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  final bool success = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Confirm Withdrawal",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Amount: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "₦10,000",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bank: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Sterling Bank",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Account Number: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  "0066984129",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  success
                      ? bottomsheetpagecontroller.nextPage(
                          duration: Duration(milliseconds: 10),
                          curve: Curves.linear)
                      : bottomsheetpagecontroller.jumpToPage(2);
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 79, 14),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      "Confirm Withdrawal",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 79, 14),
                      )),
                  child: Center(
                    child: Text(
                      "Edit Detail",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 79, 14), fontSize: 19),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
