import 'package:flutter/material.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';

/// Card displaying Myanmar date information
class MyanmarDateCard extends StatelessWidget {
  const MyanmarDateCard({required this.dayDetails, super.key});

  final DayDetails dayDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade900.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.shade700.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Day of week
          Text(
            dayDetails.dayOfWeek,
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue.shade200,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          // Myanmar date
          Text(
            dayDetails.myanmarDateString,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          // Western date
          Text(
            dayDetails.formattedWesternDate,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
