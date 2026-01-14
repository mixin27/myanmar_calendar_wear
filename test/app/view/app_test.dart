import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myanmar_calendar_wear/ambient_mode/ambient_mode.dart';
import 'package:myanmar_calendar_wear/app/app.dart';
import 'package:myanmar_calendar_wear/features/day_details/views/day_details_screen.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    setUpAll(() {
      AmbientModeListener.instance.value = false;
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(DayDetailsScreen), findsOneWidget);
    });

    group('renders the correct color scheme', () {
      testWidgets('on ambient mode updates', (tester) async {
        await tester.pumpWidget(const App());

        MaterialApp getMaterialApp() {
          return find.byType(MaterialApp).evaluate().first.widget
              as MaterialApp;
        }

        expect(
          getMaterialApp().theme?.colorScheme,
          const ColorScheme.dark(primary: Color(0xFF00B5FF)),
        );

        await simulatePlatformCall('ambient_mode', 'onUpdateAmbient');
        await tester.pumpAndSettle();

        expect(
          getMaterialApp().theme?.colorScheme,
          const ColorScheme.dark(
            primary: Colors.white24,
            onSurface: Colors.white10,
          ),
        );

        await simulatePlatformCall('ambient_mode', 'onExitAmbient');
        await tester.pumpAndSettle();

        expect(
          getMaterialApp().theme?.colorScheme,
          const ColorScheme.dark(primary: Color(0xFF00B5FF)),
        );
      });
    });
  });
}
