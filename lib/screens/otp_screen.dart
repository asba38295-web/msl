import 'package:flutter/material.dart';
import 'choose_profile_screen.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 28),
                color: const Color(0xFF15004E),
              ),

              const SizedBox(height: 15),

              const Text(
                "Entrer le code",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF15004E),
                ),
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    style: const TextStyle(
                      letterSpacing: 22,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "Le code contient 6 chiffres",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const Spacer(),

              Center(
                child: Container(
                  width: 200,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF0A144A),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChooseProfileScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
