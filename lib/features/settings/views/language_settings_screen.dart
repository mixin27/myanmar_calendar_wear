import 'package:flutter/material.dart';
import 'package:myanmar_calendar_wear/shared/models/language.dart';
import 'package:wear_plus/wear_plus.dart';

/// Screen for selecting language
class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({
    required this.currentLanguage,
    required this.onLanguageChanged,
    super.key,
  });

  final AppLanguage currentLanguage;
  final void Function(AppLanguage language) onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WatchShape(
        builder: (context, shape, child) {
          final isRound = shape == WearShape.round;

          return SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    isRound ? 20 : 12,
                    isRound ? 16 : 8,
                    isRound ? 20 : 12,
                    8,
                  ),
                  child: const Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Language list
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isRound ? 20 : 12,
                    ),
                    children: AppLanguage.values.map((lang) {
                      final isSelected = lang == currentLanguage;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: () {
                            onLanguageChanged(lang);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue.shade700.withValues(alpha: 0.5)
                                  : Colors.grey.shade900.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue.shade500
                                    : Colors.grey.shade700.withValues(
                                        alpha: 0.5,
                                      ),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                if (isSelected)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.check_circle,
                                      size: 16,
                                      color: Colors.blue.shade300,
                                    ),
                                  ),
                                Expanded(
                                  child: Text(
                                    lang.nativeName,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
