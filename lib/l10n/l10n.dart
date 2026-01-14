import 'package:flutter/widgets.dart';
import 'package:myanmar_calendar_wear/l10n/gen/app_localizations.dart';

export 'package:myanmar_calendar_wear/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
