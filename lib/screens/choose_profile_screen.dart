import 'package:flutter/material.dart';

class ChooseProfileScreen extends StatelessWidget {
  const ChooseProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ========= Bottom Navigation =========
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 38),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "Tracking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Notification",
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========= Header =========
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey Ali,",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff072A53),
                      ),
                    ),
                    Text(
                      "Welcome to mersoul",
                      style: TextStyle(fontSize: 16, color: Color(0xffF05A3E)),
                    ),
                  ],
                ),

                // avatar image (replace with your image)
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 65,
                    height: 65,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            // ========= Title =========
            const Text(
              "YOU ARE ?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xff072A53),
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Choose your profile to continue\nYou can safely send all types of packages",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffF05A3E),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 40),

            // ========= Sender Button =========
            _bigButton(
              icon: Icons.local_shipping_outlined,
              text: "Sender",
              onTap: () {},
            ),

            const SizedBox(height: 25),

            // ========= Transporter Button =========
            _bigButton(
              icon: Icons.directions_car_outlined,
              text: "Transporter",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  /// reusable big button
  Widget _bigButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xff072A53),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: Colors.red, size: 32),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(
                Icons.arrow_right_alt,
                color: Colors.orangeAccent,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
