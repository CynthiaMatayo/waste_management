import 'package:flutter/material.dart';
import 'package:waste_management/models/controllers.dart';
import 'package:waste_management/withdraw/confirm.dart';
import 'package:waste_management/withdraw/successful_withdrawal.dart';
import 'package:waste_management/withdraw/withdrawal_failed.dart';

class WithdrawFund extends StatefulWidget {
  const WithdrawFund({super.key});

  @override
  State<WithdrawFund> createState() => _WithdrawFundState();
}

class _WithdrawFundState extends State<WithdrawFund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 251, 229),
        title: Text(
          "Withdraw funds from wallet",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Center(
                    child: Text(
                  "Available Balance:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 3,
              ),
              Center(
                child: Text(
                  "₦ 12000.00",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 67, 132, 70),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Amount to withdraw",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 3,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 230, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "e.g ₦ 2000",
                    hintStyle: TextStyle(fontSize: 18)),
              ),
              Text("(Note: Minimum withdrawal amount is ₦ 1000)"),
              SizedBox(
                height: 14,
              ),
              Text(
                "Select Bank Destination",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 3,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 230, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "Sterling Bank - 0066984129",
                    hintStyle: TextStyle(fontSize: 18),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.expand_more))),
              ),
              Text(
                "Enter generated OTP",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 3,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 230, 227, 227),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "(OTP) Generated",
                    hintStyle: TextStyle(fontSize: 18)),
              ),
              Text("An OTP has been to cynthiamatayo@gmail.com"),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 246, 251, 229),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: PageView(
                              controller: bottomsheetpagecontroller,
                              children: [
                                Confirm(),
                                SuccessfulWithdrawal(),
                                WithdrawalFailed(),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 79, 14),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Center(
                          child: Text(
                        "Withdraw Fund",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    )),
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 45,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: Color.fromARGB(255, 67, 132, 70),
                          )),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 67, 132, 70),
                              fontSize: 19),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
