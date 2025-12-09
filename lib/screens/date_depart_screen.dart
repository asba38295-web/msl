import 'package:flutter/material.dart';
import 'choose_transporter_screen.dart';

class DateDepartScreen extends StatefulWidget {
  final String departCity;
  final String arriveeCity;

  const DateDepartScreen({
    super.key,
    required this.departCity,
    required this.arriveeCity,
  });

  @override
  State<DateDepartScreen> createState() => _DateDepartScreenState();
}

class _DateDepartScreenState extends State<DateDepartScreen> {
  static const Color kPurple = Color(0xFF2B1460);
  static const Color kOrange = Color(0xFFFF5A36);

  DateTime? selectedDate;

  List<DateTime> generateMonths() {
    DateTime now = DateTime.now();
    return List.generate(6, (i) => DateTime(now.year, now.month + i, 1));
  }

  String formatMonth(DateTime date) {
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
    return "${months[date.month - 1]} ${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> months = generateMonths();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: kOrange,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${widget.departCity} > ${widget.arriveeCity}",
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              const Text(
                "Date de partir ?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: kPurple,
                ),
              ),

              const SizedBox(height: 30),

              for (var month in months) ...[
                buildMonth(month, screenWidth),
                const SizedBox(height: 30),
              ],

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMonth(DateTime month, double screenWidth) {
    String title = formatMonth(month);
    int totalDays = DateTime(month.year, month.month + 1, 0).day;

    double itemSize = (screenWidth - 24 * 2 - 26 * 6) / 7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 18),

        Wrap(
          spacing: 26,
          runSpacing: 22,
          children: [
            for (int day = 1; day <= totalDays; day++)
              GestureDetector(
                onTap: () {
                  selectedDate = DateTime(month.year, month.month, day);

                  /// 🚀 مباشرة navigation بعد اختيار التاريخ
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ChooseTransporterScreen(
                        departCity: widget.departCity,
                        arriveeCity: widget.arriveeCity,
                        selectedDate: selectedDate!,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: itemSize + 10,
                  height: itemSize + 10,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedDate != null &&
                            selectedDate!.year == month.year &&
                            selectedDate!.month == month.month &&
                            selectedDate!.day == day
                        ? kOrange
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "$day",
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          selectedDate != null &&
                              selectedDate!.day == day &&
                              selectedDate!.month == month.month
                          ? Colors.white
                          : Colors.black,
                      fontWeight:
                          selectedDate != null &&
                              selectedDate!.day == day &&
                              selectedDate!.month == month.month
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
