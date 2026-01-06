part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.initial() = _LocaleInitialState;
  const factory LocaleState.loading() = _GetLocaleLoadingState;
  const factory LocaleState.error(String message) = _GetLocaleErrorState;
  const factory LocaleState.loaded({
    required Locale? locale,
  }) = _GetLocaleLoadedState;
}
