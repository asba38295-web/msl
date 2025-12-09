import 'package:flutter/material.dart';
class SendTypeScreen extends StatelessWidget {
  const SendTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          // Bottom gradient
          Positioned(
            bottom: -120,
            left: 0,
            right: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF5722), Color(0x00FFFFFF)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFFF5722),
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Title
                  const Text(
                    "What do you want to send?",
                    style: TextStyle(
                      color: Color(0xFF0B1A2C),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Choose what you want send",
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 16),
                  ),

                  const SizedBox(height: 40),

                  // BUTTON 1
                  _optionButton(
                    icon: Icons.description_outlined,
                    label: "Documents",
                    onTap: () {},
                  ),

                  const SizedBox(height: 20),

                  // BUTTON 2
                  _optionButton(
                    icon: Icons.inbox_outlined,
                    label: "Package",
                    onTap: () {},
                  ),

                  const SizedBox(height: 20),

                  // BUTTON 3
                  _optionButton(
                    icon: Icons.chair_outlined,
                    label: "Equipment",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            Icon(icon, size: 34, color: Color(0xFFFF5722)),
            const SizedBox(width: 14),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFFFF5722),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
