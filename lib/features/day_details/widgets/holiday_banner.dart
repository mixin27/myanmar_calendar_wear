import 'package:flutter/material.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';

/// Banner displaying public holidays
class HolidayBanner extends StatelessWidget {
  const HolidayBanner({
    required this.dayDetails,
    super.key,
  });

  final DayDetails dayDetails;

  @override
  Widget build(BuildContext context) {
    final holidays = dayDetails.holidays;

    if (holidays.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade900.withValues(alpha: 0.5),
            Colors.pink.shade900.withValues(alpha: 0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.red.shade600.withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.celebration,
            color: Colors.red.shade200,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: holidays.map((holiday) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    holiday.trim(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
