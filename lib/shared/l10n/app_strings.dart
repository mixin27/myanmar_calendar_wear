import 'package:myanmar_calendar_wear/shared/models/language.dart';

/// Application strings for UI elements
class AppStrings {
  const AppStrings(this.language);

  final AppLanguage language;

  String get today {
    switch (language) {
      case AppLanguage.myanmar:
        return 'ယနေ့';
      case AppLanguage.english:
        return 'Today';
      case AppLanguage.shan:
        return 'ၵမ်းၼႆႉ';
      case AppLanguage.karen:
        return 'န့ၣ်ယံာ်';
      case AppLanguage.mon:
        return 'တ္ၚဲဏံ';
    }
  }

  String get holiday {
    switch (language) {
      case AppLanguage.myanmar:
        return 'ရုံးပိုင်းရက်';
      case AppLanguage.english:
        return 'Holiday';
      case AppLanguage.shan:
        return 'ဝၼ်းပိုၼ်ႉ';
      case AppLanguage.karen:
        return 'န့ၣ်ဟ့ၣ်လီၤ';
      case AppLanguage.mon:
        return 'တ္ၚဲသ္ကိုပ်';
    }
  }

  String get sabbath {
    switch (language) {
      case AppLanguage.myanmar:
        return 'ဥပုသ်နေ့';
      case AppLanguage.english:
        return 'Sabbath';
      case AppLanguage.shan:
        return 'ဝၼ်းဢုပ်ႇပိုတ်ႉ';
      case AppLanguage.karen:
        return 'န့ၣ်ဖျဲၣ်';
      case AppLanguage.mon:
        return 'တ္ၚဲဥပုသ်';
    }
  }

  String get moonPhase {
    switch (language) {
      case AppLanguage.myanmar:
        return 'လဆန်း';
      case AppLanguage.english:
        return 'Moon Phase';
      case AppLanguage.shan:
        return 'လိူၼ်သၢမ်';
      case AppLanguage.karen:
        return 'လါထံ';
      case AppLanguage.mon:
        return 'ဂိတုသာ်';
    }
  }

  String get astrology {
    switch (language) {
      case AppLanguage.myanmar:
        return 'ဗေဒင်';
      case AppLanguage.english:
        return 'Astrology';
      case AppLanguage.shan:
        return 'သိူဝ်ႇသႃႇ';
      case AppLanguage.karen:
        return 'ဘ့ၣ်ဒ့ၣ်';
      case AppLanguage.mon:
        return 'ဗေဒၚင်';
    }
  }

  String get auspiciousTime {
    switch (language) {
      case AppLanguage.myanmar:
        return 'ကောင်းချိန်';
      case AppLanguage.english:
        return 'Auspicious Time';
      case AppLanguage.shan:
        return 'ယၢမ်းလီ';
      case AppLanguage.karen:
        return 'အ့ၣ်ချ့တ့ၢ်';
      case AppLanguage.mon:
        return 'အခိင်ခိုဟ်';
    }
  }

  String get previousDay {
    switch (language) {
      case AppLanguage.myanmar:
        return 'မနေ့က';
      case AppLanguage.english:
        return 'Previous';
      case AppLanguage.shan:
        return 'မိူဝ်းဝၼ်း';
      case AppLanguage.karen:
        return 'န့ၢ်တ့ၢ်';
      case AppLanguage.mon:
        return 'တ္ၚဲကိုပ်';
    }
  }

  String get nextDay {
    switch (language) {
      case AppLanguage.myanmar:
        return 'မနက်ဖြန်';
      case AppLanguage.english:
        return 'Next';
      case AppLanguage.shan:
        return 'မိူဝ်းဝၼ်း';
      case AppLanguage.karen:
        return 'န့ၢ်န့ၣ်';
      case AppLanguage.mon:
        return 'တ္ၚဲယျ';
    }
  }

  String get nagaHead {
    switch (language) {
      case AppLanguage.myanmar:
        return 'နဂါးခေါင်း';
      case AppLanguage.english:
        return 'Naga Head';
      case AppLanguage.shan:
        return 'နဂါးခေါင်း';
      case AppLanguage.karen:
        return 'နဂါးခေါင်း';
      case AppLanguage.mon:
        return 'နဂါးခေါင်း';
    }
  }

  String get mahabote {
    switch (language) {
      case AppLanguage.myanmar:
        return 'မဟာဘုတ်';
      case AppLanguage.english:
        return 'Mahabote';
      case AppLanguage.shan:
        return 'မဟာဘုတ်';
      case AppLanguage.karen:
        return 'မဟာဘုတ်';
      case AppLanguage.mon:
        return 'မဟာဘုတ်';
    }
  }

  String get nakhat {
    switch (language) {
      case AppLanguage.myanmar:
        return 'နတ်ခတ်';
      case AppLanguage.english:
        return 'Nakhat';
      case AppLanguage.shan:
        return 'နတ်ခတ်';
      case AppLanguage.karen:
        return 'နတ်ခတ်';
      case AppLanguage.mon:
        return 'နတ်ခတ်';
    }
  }
}
