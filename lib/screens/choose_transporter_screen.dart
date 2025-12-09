import 'package:flutter/material.dart';

class ChooseTransporterScreen extends StatelessWidget {
  static const Color kPurple = Color(0xFF2B1460);
  static const Color kOrange = Color(0xFFFF5A36);

  final String departCity;
  final String arriveeCity;
  final DateTime selectedDate;

  ChooseTransporterScreen({
    super.key,
    required this.departCity,
    required this.arriveeCity,
    required this.selectedDate,
  });

  final List<Map<String, dynamic>> transporters = [
    {
      "name": "Aimad Rodani",
      "vehicle": "Ford : Fiesta",
      "rating": 4.98,
      "price": 45,
      "image": "assets/brahima.jpg",
    },
    {
      "name": "Fatima Routh",
      "vehicle": "BMW : Serie 1",
      "rating": 5.0,
      "price": 48,
      "image": "assets/brahima.jpg",
    },
    {
      "name": "ayoub skar",
      "vehicle": "BMW : Serie 1",
      "rating": 5.0,
      "price": 48,
      "image": "assets/brahima.jpg",
    },
    {
      "name": "brahim agaigou",
      "vehicle": "BMW : Serie 1",
      "rating": 5.0,
      "price": 48,
      "image": "assets/brahima.jpg",
    },
    {
      "name": "Alice Dortg",
      "vehicle": "Mercedis : 250",
      "rating": 4.94,
      "price": 50,
      "image": "assets/brahima.jpg",
    },
    {
      "name": "Amine Tahiri",
      "vehicle": "Ford : Fargonit",
      "rating": 3.90,
      "price": 52,
      "image": "assets/brahima.jpg",
    },
  ];

  /// Format date => "Samedi, 02 Avril"
  String formatDate(DateTime date) {
    const days = [
      "Lundi",
      "Mardi",
      "Mercredi",
      "Jeudi",
      "Vendredi",
      "Samedi",
      "Dimanche",
    ];

    const months = [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre",
    ];

    String day = days[date.weekday - 1];
    String month = months[date.month - 1];

    return "$day, ${date.day.toString().padLeft(2, '0')} $month";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              /// HEADER DYNAMIQUE
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: kOrange,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$departCity > $arriveeCity",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        formatDate(selectedDate),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 22),

              /// Titles
              const Text(
                "Choose transporter",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: kPurple,
                ),
              ),
              const Text(
                "Choose who what",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "You can safely send all types of packages",
                style: TextStyle(color: kOrange, fontSize: 15, height: 1.3),
              ),

              const SizedBox(height: 25),

              /// LISTE TRANSPORTEURS
              Expanded(
                child: ListView.builder(
                  itemCount: transporters.length,
                  itemBuilder: (context, index) {
                    final t = transporters[index];
                    return buildTransporterCard(
                      name: t["name"],
                      vehicle: t["vehicle"],
                      rating: t["rating"],
                      price: t["price"],
                      imageUrl: t["image"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// CARD WIDGET
  Widget buildTransporterCard({
    required String name,
    required String vehicle,
    required double rating,
    required int price,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FA),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Profile Picture
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 14),

              /// Text info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPurple,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Transporter",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Vehicule",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      vehicle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: kOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              /// Right Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Member since",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const Text("12/01/2023", style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  Text(
                    "${price}\$",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: kOrange,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Rating + Button
          Row(
            children: [
              /// Rating Box
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: kOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  rating.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              /// Stars
              Row(
                children: List.generate(
                  5,
                  (i) => const Icon(Icons.star, color: Colors.amber, size: 22),
                ),
              ),

              const Spacer(),

              const Text(
                "Voir profil ↗",
                style: TextStyle(
                  color: kOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),

              const SizedBox(width: 14),

              /// CONFIRMER BUTTON
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: kOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Confirmer",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
