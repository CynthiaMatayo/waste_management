import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';

class WithdrawalFailed extends StatefulWidget {
  const WithdrawalFailed({super.key});

  @override
  State<WithdrawalFailed> createState() => _WithdrawalFailedState();
}

class _WithdrawalFailedState extends State<WithdrawalFailed> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: ClipOval(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 246, 251, 229),
                  child: Icon(
                    Icons.error_outlined,
                    color: Colors.redAccent,
                    size: 68,
                  ),
                ),
              ),
            ),
          ),
          Text("Withdrawal Failed!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              textAlign: TextAlign.center,
              "There was an issue processing your withdrawal. Please check your bank details and try again. If the issue persists, contact support.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.redAccent),
                  child: Center(
                      child: Text(
                    "Contact Support!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  )),
                ),
              )),
          TextButton(
            onPressed: () {
              bottomsheetpagecontroller.previousPage(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.decelerate);
            },
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Colors.green,
                ),
              ),
              child: Center(
                child: Text(
                  "Back to Wallet",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 79, 14),
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
