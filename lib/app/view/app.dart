import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myanmar_calendar_wear/ambient_mode/ambient_mode.dart';
import 'package:myanmar_calendar_wear/features/day_details/bloc/day_details_bloc.dart';
import 'package:myanmar_calendar_wear/features/day_details/views/day_details_screen.dart';
import 'package:myanmar_calendar_wear/features/settings/views/language_settings_screen.dart';
import 'package:myanmar_calendar_wear/shared/models/language.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppLanguage _currentLanguage = AppLanguage.myanmar;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  late DayDetailsBloc _dayDetailsBloc;

  @override
  void initState() {
    super.initState();
    _dayDetailsBloc = DayDetailsBloc()..add(const LoadToday());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dayDetailsBloc,
      child: AmbientModeBuilder(
        child: DayDetailsScreen(language: _currentLanguage),
        builder: (context, isAmbientModeActive, child) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            title: 'Myanmar Calendar',
            theme: ThemeData(
              useMaterial3: true,
              visualDensity: VisualDensity.compact,
              colorScheme: isAmbientModeActive
                  ? const ColorScheme.dark(
                      primary: Colors.white24,
                      onSurface: Colors.white10,
                    )
                  : const ColorScheme.dark(primary: Color(0xFF00B5FF)),
            ),
            debugShowCheckedModeBanner: false,
            home: child,
            routes: {
              '/settings': (context) => LanguageSettingsScreen(
                currentLanguage: _currentLanguage,
                onLanguageChanged: (newLanguage) {
                  setState(() {
                    _currentLanguage = newLanguage;
                  });
                  context.read<DayDetailsBloc>().add(
                    ChangeLanguage(newLanguage.toCalendarLanguage()),
                  );
                },
              ),
            },
          );
        },
      ),
    );
  }
}
