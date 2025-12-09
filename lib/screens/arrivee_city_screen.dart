import 'package:flutter/material.dart';
import 'date_depart_screen.dart';

class ArriveeCityScreen extends StatelessWidget {
  final String departCity;

  const ArriveeCityScreen({super.key, required this.departCity});

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
    'Fès',
    'Oujda',
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
                'Ville d’arrivée',
                style: TextStyle(
                  color: kPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Départ : $departCity",
                style: TextStyle(
                  color: kOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 28),
              Expanded(
                child: ListView.separated(
                  itemCount: cities.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  padding: const EdgeInsets.only(top: 6, bottom: 24),
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return InkWell(
                      onTap: () async {
                        final selectedDay = await Navigator.push<int>(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DateDepartScreen(
                              departCity: departCity,
                              arriveeCity: city,
                            ),
                          ),
                        );
                        if (selectedDay != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Jour sélectionné: $selectedDay"),
                            ),
                          );
                        }
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
