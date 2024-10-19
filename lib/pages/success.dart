import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'home.dart';
import '../main.dart';

class Success extends StatefulWidget {
  final String pin;
  const Success({super.key, required this.pin});

  @override
  SuccessState createState() => SuccessState();
}

class SuccessState extends State<Success> {
  String get formattedPin {
    final numberFormat = NumberFormat.decimalPattern('en_IN');
    return numberFormat.format(int.parse(widget.pin));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toplayer(),
      backgroundColor: const Color.fromRGBO(15, 5, 27, 1),
      body: body(),
      bottomNavigationBar: bottomlayer(),
    );
  }

  AppBar toplayer() {
    return AppBar(
      backgroundColor: Colors.green,
      toolbarHeight: 0, // Set the height of the app bar
    );
  }

  Widget body() {
    return  Column(
        children: [
          const SizedBox(height: 70),
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 120,
            ),
          ),
          const SizedBox(height: 50),
          const Center(
            child: Text(
              "Bank account balance \n fetched successfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 25, // Width of the rectangle
                height: 25, // Height of the rectangle
                decoration: BoxDecoration(
                  color: Colors.white, // Add white background color
                  image: const DecorationImage(
                    image: AssetImage("assets/icons/icici.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "ICICI Bank - XX83",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Available balance:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "₹$formattedPin.00",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
    );
  }

  Widget bottomlayer() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 60,
        color: const Color.fromRGBO(24, 8, 44, 1),
        child: const Center(
          child: Text(
            'DONE',
            style: TextStyle(
              color: Color.fromRGBO(148, 61, 254, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}