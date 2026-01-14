import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myanmar_calendar_dart/myanmar_calendar_dart.dart';
import 'package:myanmar_calendar_wear/features/day_details/models/day_details.dart';

part 'day_details_event.dart';
part 'day_details_state.dart';

class DayDetailsBloc extends Bloc<DayDetailsEvent, DayDetailsState> {
  DayDetailsBloc({String initialLanguage = 'my'})
    : _currentLanguage = initialLanguage,
      super(const DayDetailsInitial()) {
    on<LoadToday>(_onLoadToday);
    on<NavigateToPreviousDay>(_onNavigateToPreviousDay);
    on<NavigateToNextDay>(_onNavigateToNextDay);
    on<LoadSpecificDate>(_onLoadSpecificDate);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  String _currentLanguage;

  void _onLoadToday(LoadToday event, Emitter<DayDetailsState> emit) {
    try {
      emit(const DayDetailsLoading());
      final dayDetails = DayDetails.today();
      emit(DayDetailsLoaded(dayDetails));
    } on Exception catch (e) {
      emit(DayDetailsError('Failed to load today: $e'));
    }
  }

  void _onNavigateToPreviousDay(
    NavigateToPreviousDay event,
    Emitter<DayDetailsState> emit,
  ) {
    final currentState = state;
    if (currentState is DayDetailsLoaded) {
      try {
        final previousDay = currentState.dayDetails.previousDay;
        emit(DayDetailsLoaded(previousDay));
      } on Exception catch (e) {
        emit(DayDetailsError('Failed to navigate: $e'));
      }
    }
  }

  void _onNavigateToNextDay(
    NavigateToNextDay event,
    Emitter<DayDetailsState> emit,
  ) {
    final currentState = state;
    if (currentState is DayDetailsLoaded) {
      try {
        final nextDay = currentState.dayDetails.nextDay;
        emit(DayDetailsLoaded(nextDay));
      } on Exception catch (e) {
        emit(DayDetailsError('Failed to navigate: $e'));
      }
    }
  }

  void _onLoadSpecificDate(
    LoadSpecificDate event,
    Emitter<DayDetailsState> emit,
  ) {
    try {
      emit(const DayDetailsLoading());
      final dayDetails = DayDetails.fromDateTime(
        event.date,
      );
      emit(DayDetailsLoaded(dayDetails));
    } on Exception catch (e) {
      emit(DayDetailsError('Failed to load date: $e'));
    }
  }

  void _onChangeLanguage(
    ChangeLanguage event,
    Emitter<DayDetailsState> emit,
  ) {
    _currentLanguage = event.languageCode;
    final currentState = state;

    if (currentState is DayDetailsLoaded) {
      try {
        MyanmarCalendar.setLanguage(Language.fromCode(_currentLanguage));

        final dayDetails = DayDetails.fromDateTime(
          currentState.dayDetails.westernDate,
        );
        emit(DayDetailsLoaded(dayDetails));
      } on Exception catch (e) {
        emit(DayDetailsError('Failed to change language: $e'));
      }
    }
  }
}
