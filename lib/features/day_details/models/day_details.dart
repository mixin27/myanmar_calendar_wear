import 'package:equatable/equatable.dart';
import 'package:myanmar_calendar_dart/myanmar_calendar_dart.dart';

/// Complete day information including Myanmar calendar data
class DayDetails extends Equatable {
  const DayDetails({
    required this.westernDate,
    required this.myanmarDate,
  });

  /// Create DayDetails from a DateTime
  factory DayDetails.fromDateTime(DateTime date) {
    final myanmarDate = MyanmarCalendar.fromDateTime(date);
    return DayDetails(
      westernDate: date,
      myanmarDate: myanmarDate.myanmarDate,
    );
  }

  /// Get today's details
  factory DayDetails.today() {
    final now = DateTime.now();
    return DayDetails.fromDateTime(now);
  }

  final DateTime westernDate;
  final MyanmarDate myanmarDate;

  /// Get previous day
  DayDetails get previousDay {
    final prevDate = westernDate.subtract(const Duration(days: 1));
    return DayDetails.fromDateTime(prevDate);
  }

  /// Get next day
  DayDetails get nextDay {
    final nextDate = westernDate.add(const Duration(days: 1));
    return DayDetails.fromDateTime(nextDate);
  }

  /// Check if this is today
  bool get isToday {
    final now = DateTime.now();
    return westernDate.year == now.year &&
        westernDate.month == now.month &&
        westernDate.day == now.day;
  }

  /// Get formatted western date string
  String get formattedWesternDate {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[westernDate.month - 1]} ${westernDate.day}, ${westernDate.year}';
  }

  CompleteDate get completeDate {
    return MyanmarCalendar.fromWestern(
      westernDate.year,
      westernDate.month,
      westernDate.day,
    ).completeDate;
  }

  /// Get Myanmar date string
  String get myanmarDateString {
    final currentLangue = MyanmarCalendar.currentLanguage;
    if (currentLangue == Language.shan) {
      final year = completeDate.shanYear;
      return '${myanmarDate.format(pattern: '$year &M &P &ff')} ${TranslationService.translate('Yat')}';
    } else {
      return '${myanmarDate.format()} ${TranslationService.translate('Yat')}';
    }
  }

  /// Get day of week in Myanmar
  String get dayOfWeek {
    return myanmarDate.format(pattern: '&W');
  }

  /// Get month name
  String get monthName {
    return myanmarDate.format(pattern: '&M');
  }

  /// Get moon phase name
  String get moonPhaseName {
    return myanmarDate.format(pattern: '&P');
  }

  /// Get moon phase
  int get moonPhase {
    return myanmarDate.moonPhase;
  }

  /// Get fortnight day
  String get fortnightDay {
    return myanmarDate.format(pattern: '&ff');
  }

  /// Check if it's a sabbath day
  bool get isSabbath {
    return completeDate.isSabbath;
  }

  /// Get sabbath eve value
  bool get sabbathEve {
    return completeDate.isSabbathEve;
  }

  /// Get yatyaza (inauspicious) value
  String get yatyaza {
    return completeDate.yatyaza;
  }

  /// Get pyathada (obstacle) value
  String get pyathada {
    return completeDate.pyathada;
  }

  /// Get astrological days
  List<String> get astrologicalDays {
    return completeDate.astrologicalDays;
  }

  /// Get nagahle direction
  String get nagahle {
    return completeDate.nagahle;
  }

  /// Get mahabote
  String get mahabote {
    return completeDate.mahabote;
  }

  /// Get nakhat
  String get nakhat {
    return completeDate.nakhat;
  }

  /// Get all holidays for this day
  List<String> get holidays {
    return completeDate.allHolidays;
  }

  /// Check if there are any astrology warnings
  bool get hasAstrologyWarnings {
    return yatyaza.isNotEmpty ||
        pyathada.isNotEmpty ||
        astrologicalDays.isNotEmpty;
  }

  @override
  List<Object?> get props => [westernDate, myanmarDate];
}
