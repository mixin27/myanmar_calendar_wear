part of 'day_details_bloc.dart';

sealed class DayDetailsEvent extends Equatable {
  const DayDetailsEvent();

  @override
  List<Object> get props => [];
}

/// Load today's details
final class LoadToday extends DayDetailsEvent {
  const LoadToday();
}

/// Navigate to previous day
final class NavigateToPreviousDay extends DayDetailsEvent {
  const NavigateToPreviousDay();
}

/// Navigate to next day
final class NavigateToNextDay extends DayDetailsEvent {
  const NavigateToNextDay();
}

/// Load specific date
final class LoadSpecificDate extends DayDetailsEvent {
  const LoadSpecificDate(this.date);

  final DateTime date;

  @override
  List<Object> get props => [date];
}

/// Change language
final class ChangeLanguage extends DayDetailsEvent {
  const ChangeLanguage(this.languageCode);

  final String languageCode;

  @override
  List<Object> get props => [languageCode];
}
