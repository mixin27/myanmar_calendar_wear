import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myanmar_calendar_wear/features/day_details/bloc/day_details_bloc.dart';
import 'package:myanmar_calendar_wear/features/day_details/widgets/additional_info_widget.dart';
import 'package:myanmar_calendar_wear/features/day_details/widgets/astrology_warning.dart';
import 'package:myanmar_calendar_wear/features/day_details/widgets/holiday_banner.dart';
import 'package:myanmar_calendar_wear/features/day_details/widgets/moon_phase_widget.dart';
import 'package:myanmar_calendar_wear/features/day_details/widgets/myanmar_date_card.dart';
import 'package:myanmar_calendar_wear/features/day_details/widgets/sabbath_indicator.dart';
import 'package:myanmar_calendar_wear/shared/l10n/app_strings.dart';
import 'package:myanmar_calendar_wear/shared/models/language.dart';
import 'package:wear_plus/wear_plus.dart';

/// Main screen for displaying day details on WearOS
class DayDetailsScreen extends StatelessWidget {
  const DayDetailsScreen({
    this.language = AppLanguage.myanmar,
    super.key,
  });

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return _DayDetailsView(language: language);
  }
}

class _DayDetailsView extends StatelessWidget {
  const _DayDetailsView({required this.language});
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WatchShape(
        builder: (context, shape, child) {
          return Stack(
            children: [
              SafeArea(
                child: BlocBuilder<DayDetailsBloc, DayDetailsState>(
                  builder: (context, state) {
                    if (state is DayDetailsLoading ||
                        state is DayDetailsInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      );
                    }

                    if (state is DayDetailsError) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }

                    if (state is DayDetailsLoaded) {
                      return _buildContent(context, state, shape);
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: -8,
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    style: IconButton.styleFrom(
                      foregroundColor: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      context.read<DayDetailsBloc>().add(
                        const NavigateToPreviousDay(),
                      );
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: -8,
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    style: IconButton.styleFrom(
                      foregroundColor: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      context.read<DayDetailsBloc>().add(
                        const NavigateToNextDay(),
                      );
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    DayDetailsLoaded state,
    WearShape shape,
  ) {
    final isRound = shape == WearShape.round;
    final dayDetails = state.dayDetails;

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < 0) {
            // Swipe left - next day
            context.read<DayDetailsBloc>().add(const NavigateToNextDay());
          } else if (details.primaryVelocity! > 0) {
            // Swipe right - previous day
            context.read<DayDetailsBloc>().add(
              const NavigateToPreviousDay(),
            );
          }
        }
      },
      child: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              isRound ? 20 : 12,
              isRound ? 24 : 12,
              isRound ? 20 : 12,
              isRound ? 24 : 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Today indicator
                Row(
                  mainAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    if (dayDetails.isToday)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade700.withValues(
                                alpha: 0.4,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.green.shade500,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              AppStrings(language).today,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),

                    if (!dayDetails.isToday)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade700.withValues(
                                alpha: 0.4,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.green.shade500,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              dayDetails.monthName,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                // Myanmar Date Card
                MyanmarDateCard(dayDetails: dayDetails),
                const SizedBox(height: 10),

                // Holiday Banner
                HolidayBanner(dayDetails: dayDetails),
                if (dayDetails.holidays.isNotEmpty) const SizedBox(height: 10),

                // Sabbath Indicator
                SabbathIndicator(
                  dayDetails: dayDetails,
                  language: language,
                ),
                if (dayDetails.isSabbath || dayDetails.sabbathEve)
                  const SizedBox(height: 10),

                // Moon Phase
                MoonPhaseWidget(dayDetails: dayDetails),
                const SizedBox(height: 10),

                // Astrology Warnings
                AstrologyWarnings(dayDetails: dayDetails),
                if (dayDetails.hasAstrologyWarnings) const SizedBox(height: 10),

                // Additional Info
                AdditionalInfoWidget(dayDetails: dayDetails),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // Top navigation buttons
          Positioned(
            top: 8,
            left: 8,
            right: 8,
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              spacing: 8,
              children: [
                // Settings button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.language,
                      size: 14,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),

                // Today button (only if not today)
                if (!dayDetails.isToday)
                  GestureDetector(
                    onTap: () {
                      context.read<DayDetailsBloc>().add(const LoadToday());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.today,
                            size: 12,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppStrings(language).today,
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
