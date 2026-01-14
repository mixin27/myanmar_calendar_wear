/// Supported languages for the app
enum AppLanguage {
  myanmar('my', 'Myanmar'),
  english('en', 'English'),
  shan('shan', 'Shan'),
  karen('karen', 'Karen'),
  mon('mon', 'Mon')
  ;

  const AppLanguage(this.code, this.nativeName);

  final String code;
  final String nativeName;

  /// Convert to myanmar_calendar_dart language code
  String toCalendarLanguage() {
    switch (this) {
      case AppLanguage.myanmar:
        return 'my';
      case AppLanguage.english:
        return 'en';
      case AppLanguage.shan:
        return 'shan';
      case AppLanguage.karen:
        return 'karen';
      case AppLanguage.mon:
        return 'mon';
    }
  }
}
