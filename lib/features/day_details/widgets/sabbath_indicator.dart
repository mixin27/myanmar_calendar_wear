import 'package:flutter/material.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';
import 'package:myanmar_calendar_wear/shared/l10n/app_strings.dart';
import 'package:myanmar_calendar_wear/shared/models/language.dart';

/// Indicator for sabbath days
class SabbathIndicator extends StatelessWidget {
  const SabbathIndicator({
    required this.dayDetails,
    required this.language,
    super.key,
  });

  final DayDetails dayDetails;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    if (!dayDetails.isSabbath && !dayDetails.sabbathEve) {
      return const SizedBox.shrink();
    }

    final strings = AppStrings(language);
    final isSabbath = dayDetails.isSabbath;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isSabbath
            ? Colors.orange.shade900.withValues(alpha: 0.4)
            : Colors.orange.shade800.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSabbath
              ? Colors.orange.shade600.withValues(alpha: 0.6)
              : Colors.orange.shade700.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isSabbath ? Icons.self_improvement : Icons.warning_amber,
            color: isSabbath ? Colors.orange.shade200 : Colors.orange.shade300,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              isSabbath ? strings.sabbath : '${strings.sabbath} Eve',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
