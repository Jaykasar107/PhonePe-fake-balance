import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/upi.dart';
import 'pages/success.dart';
import 'pages/check_balance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/success': (context) => const Success(pin: ''),
        '/upi': (context) => const UPI(),
        '/check_balance': (context) => const CheckBalance(),
      },
    );
  }
}