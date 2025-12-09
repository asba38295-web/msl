import 'package:flutter/material.dart';
import 'arrivee_city_screen.dart';

class DepartCityScreen extends StatelessWidget {
  const DepartCityScreen({super.key});

  static const Color kPurple = Color(0xFF2B1460);
  static const Color kOrange = Color(0xFFFF5A36);
  static const Color kGrayField = Color(0xFFF1F1F2);

  final List<String> cities = const [
    'Casablanca',
    'Tanger',
    'Rabat',
    'Mohammedia',
    'Agadir',
    'Meknes',
    'Marrakech',
    'Salé',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Text(
                'Ville de départ',
                style: TextStyle(
                  color: kPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: kGrayField,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Ville de départ',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Villes suggérées',
                style: TextStyle(
                  color: kPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: cities.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  padding: const EdgeInsets.only(top: 6, bottom: 24),
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ArriveeCityScreen(departCity: city),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              city,
                              style: TextStyle(
                                color: kPurple,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: kOrange,
                            size: 28,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          backgroundColor: Colors.white,
          elevation: 2,
          child: const Icon(Icons.close, color: Colors.black),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}
