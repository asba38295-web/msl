import 'package:flutter/material.dart';
import 'otp_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ← Back Button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 28),
                color: const Color(0xFF15004E),
              ),

              const SizedBox(height: 10),

              /// Title
              const Text(
                "Formulaire d’inscription",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF15004E),
                ),
              ),

              const SizedBox(height: 30),

              /// Row Inputs: Prénom + Nom
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Prénom",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF15004E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),

                        _inputField(firstName),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nom",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF15004E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),

                        _inputField(lastName),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              const Text(
                "Rassure-toi qu’il correspondent à ta CIN",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// Phone number
              const Text(
                "Votre numéro mobile",
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF15004E),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              _inputField(phone),

              const SizedBox(height: 10),
              const Text(
                "Nous t’enverrons un code pour vérifier ton numéro",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              /// Button ↓↓↓
              Center(
                child: Container(
                  width: 200,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A144A),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "S’inscrire",
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

  /// Custom Input Field
  Widget _inputField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
