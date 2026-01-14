import 'package:flutter/material.dart';
import 'package:myanmar_calendar_dart/myanmar_calendar_dart.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';
import 'package:myanmar_calendar_wear/shared/l10n/app_strings.dart';
import 'package:myanmar_calendar_wear/shared/models/language.dart';

/// Widget displaying additional astrology information
class AdditionalInfoWidget extends StatelessWidget {
  const AdditionalInfoWidget({
    required this.dayDetails,
    super.key,
  });

  final DayDetails dayDetails;

  @override
  Widget build(BuildContext context) {
    final language = AppLanguage.values.firstWhere(
      (lang) =>
          lang.toCalendarLanguage() == MyanmarCalendar.currentLanguage.code,
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade900.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.teal.shade700.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            AppStrings(language).nagaHead,
            TranslationService.translate(dayDetails.nagahle),
          ),
          const SizedBox(height: 6),
          _buildInfoRow(
            AppStrings(language).mahabote,
            TranslationService.translate(dayDetails.mahabote),
          ),
          const SizedBox(height: 6),
          _buildInfoRow(
            AppStrings(language).nakhat,
            TranslationService.translate(dayDetails.nakhat),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.teal.shade200,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
