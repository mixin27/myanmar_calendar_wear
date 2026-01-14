import 'package:flutter/material.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';

/// Widget displaying moon phase information
class MoonPhaseWidget extends StatelessWidget {
  const MoonPhaseWidget({
    required this.dayDetails,
    super.key,
  });

  final DayDetails dayDetails;

  IconData _getMoonIcon() {
    final moonPhase = dayDetails.moonPhase;
    switch (moonPhase) {
      // Waxing crescent
      case 0:
        return Icons.brightness_2;
      // Full moon
      case 1:
        return Icons.circle;
      // Waning crescent
      case 2:
        return Icons.brightness_3;
      // New moon
      case 3:
        return Icons.circle_outlined;
      default:
        return Icons.brightness_2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade900.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.indigo.shade700.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getMoonIcon(),
            color: Colors.yellow.shade200,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dayDetails.moonPhaseName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dayDetails.fortnightDay,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
