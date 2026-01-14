import 'package:flutter/material.dart';
import 'package:myanmar_calendar_dart/myanmar_calendar_dart.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';

/// Widget displaying astrology warnings
class AstrologyWarnings extends StatelessWidget {
  const AstrologyWarnings({
    required this.dayDetails,
    super.key,
  });

  final DayDetails dayDetails;

  List<Map<String, dynamic>> _getWarnings() {
    final warnings = <Map<String, dynamic>>[];

    if (dayDetails.yatyaza.isNotEmpty) {
      warnings.add({
        'name': TranslationService.translate(dayDetails.yatyaza),
        'icon': Icons.warning,
        'color': Colors.red,
      });
    }
    if (dayDetails.pyathada.isNotEmpty) {
      warnings.add({
        'name': TranslationService.translate(dayDetails.pyathada),
        'icon': Icons.block,
        'color': Colors.orange,
      });
    }

    if (dayDetails.astrologicalDays.isNotEmpty) {
      for (final item in dayDetails.astrologicalDays) {
        warnings.add({
          'name': TranslationService.translate(item),
          'icon': Icons.star,
          'color': Colors.orange,
        });
      }
    }

    return warnings;
  }

  @override
  Widget build(BuildContext context) {
    final warnings = _getWarnings();

    if (warnings.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple.shade900.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.purple.shade700.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: Colors.purple.shade200,
                size: 16,
              ),
              const SizedBox(width: 8),
              const Text(
                'Astrology',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: warnings.map((warning) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (warning['color'] as Color).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: (warning['color'] as Color).withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      warning['icon'] as IconData,
                      size: 12,
                      color: warning['color'] as Color,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      warning['name'] as String,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
