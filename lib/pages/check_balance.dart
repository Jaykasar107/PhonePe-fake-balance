import 'package:flutter/material.dart';
import 'upi.dart';
import 'home.dart';

class CheckBalance extends StatefulWidget {
  const CheckBalance({super.key});
  
  @override
  Checkbalance createState() => Checkbalance();
}

class Checkbalance extends State<CheckBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: toplayer(context),
      backgroundColor:const Color.fromRGBO(15, 5, 17, 1),
      body: body(),
    );
  }

  Column body() {
    return Column(
      children: [
       const SizedBox(height: 10),
        Card(
          color:const Color(0xFF1E1424),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Accounts on UPI",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                GestureDetector(
                  onTap:()
                            {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const UPI()));
                            },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4.0,
                          top: 14.0,
                          bottom: 10.0,
                        ),
                        child: Row(
                          children: [
                             Container(
                                width: 40, // Width of the rectangle
                                height: 40, // Height of the rectangle
                                decoration: BoxDecoration(
                                  color: Colors.white, // Add white background color
                                  image: const DecorationImage(
                                    image: AssetImage("assets/icons/icici.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            const SizedBox(width: 15),
                            const Text("ICICI Bank - XX83",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            ),
                          ],
                        ),
                      ),
                    const Padding(
                       padding: EdgeInsets.all(4.0),
                       child: Icon(Icons.arrow_forward_ios,color: Colors.white,size:15),
                     ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color:const Color(0xFF1E1424),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Pre-Paid Balance",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        top: 14.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40, // Width of the rectangle
                            height: 40, // Height of the rectangle
                            decoration: BoxDecoration(
                              color: Colors.white, // Add white background color
                              image: const DecorationImage(
                                image: AssetImage("assets/icons/lite-logo.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text("UPI Lite",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                        ],
                      ),
                    ),
                  const Padding(
                     padding: EdgeInsets.all(4.0),
                     child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,),
                   ),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        top: 24.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40, // Width of the rectangle
                            height: 40, // Height of the rectangle
                            decoration: BoxDecoration(
                              color: Colors.white, // Add white background color
                              image: const DecorationImage(
                                image: AssetImage("assets/icons/wallet.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text("PhonePe Wallet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                        ],
                      ),
                    ),
                  const Padding(
                     padding: EdgeInsets.all(4.0),
                     child: Icon(Icons.arrow_forward_ios,color: Colors.white,size:15),
                   ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 300,
        ),
        Container(
          height: 50, // Adjust this height based on your image size
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/upi_payment.png'),
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  AppBar toplayer(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF5B2E90), // Purple background color
      title: const Text(
        "Check Balance",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.question_mark_sharp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}