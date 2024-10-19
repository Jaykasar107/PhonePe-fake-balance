import 'package:flutter/material.dart';
import 'check_balance.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toplayer(),
      backgroundColor: const Color.fromRGBO(15, 5, 17, 1),
      body: body(),
      bottomNavigationBar: bottomlayer(),
    );
  }

 Column body() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: const Color(0xFF1E1424),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Transfer Money",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTransferOption("assets/icons/profile.png", "To Mobile\nNumber"),
                    _buildTransferOption("assets/icons/bank.png", "To Bank/\nUPI ID"),
                    _buildTransferOption("assets/icons/self.png", "To Self\nAccount"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CheckBalance()),
                        );
                      },
                      child: _buildTransferOption("assets/icons/balance.png", "Check Bank\nBalance"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  color: const Color(0xFF1E1424),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 1, color: Colors.white),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.qr_code, color: Colors.white),
                            Text(
                              " UPI ID: 7019863826@ibl",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // The expanded widget will make the image take up the remaining space
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/body.png'),
              fit: BoxFit.cover, // Ensures the image covers the area properly
            ),
          ),
        ),
      ),
    ],
  );
}

  BottomAppBar bottomlayer() {
    return BottomAppBar(
      height: 80,
      color: const Color(0xFF5B2E90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavigationItem(Icons.home, "Home", 0),
          _buildBottomNavigationItem(Icons.currency_rupee, "Loan", 1),
          _buildBottomNavigationItem(Icons.shield_outlined, "Insurance", 2),
          _buildBottomNavigationItem(Icons.trending_up, "Wealth", 3),
          _buildBottomNavigationItem(Icons.sync_alt, "History", 4),
        ],
      ),
    );
  }

  AppBar toplayer() {
    return AppBar(
      backgroundColor: const Color(0xFF5B2E90),
      title: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple, width: 2),
                  ),
                  child: const Icon(Icons.person_outline, color: Colors.deepPurple, size: 30),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/icons/india.avif'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Text(
            "Add Address",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.qr_code, color: Colors.white),
          onPressed: () {},
        ),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.white),
              onPressed: () {},
            ),
            const Positioned(
              right: 11,
              top: 11,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.help_outline, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTransferOption(String img, String label) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
            color: const Color(0xFF5B2E90),
            shape: BoxShape.rectangle,
          ),
          padding: const EdgeInsets.all(12),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(
                    color: const Color(0xFF9B60D1),
                    borderRadius: BorderRadius.circular(20),
                  )
                : null,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}