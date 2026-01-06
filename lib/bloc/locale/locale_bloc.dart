import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template/core/constant/key.dart';
import 'package:my_template/domain/cubit/safe_cubit.dart';
import 'package:my_template/utils/manager/shared_manager.dart';

part 'locale_state.dart';
part 'locale_bloc.freezed.dart';

class LocaleBloc extends SafeCubit<LocaleState> {
  LocaleBloc() : super(const LocaleState.initial());

  Future<void> getLocale() async {
    emit(const LocaleState.loading());
    try {
      final shared = SharedManager<String>();
      final code = await shared.read(AppKey.language);
      if (code == null || code.isEmpty) {
        emit(const LocaleState.loaded(locale: null));
        return;
      }
      emit(LocaleState.loaded(locale: Locale(code)));
    } catch (e) {
      emit(const LocaleState.error('Failed to get locale'));
    }
  }

  Future<void> setLocale(Locale locale) async {
    emit(const LocaleState.loading());
    try {
      final shared = SharedManager<String>();
      await shared.store(AppKey.language, locale.languageCode);
      emit(LocaleState.loaded(locale: locale));
    } catch (e) {
      emit(const LocaleState.error('Failed to set locale'));
    }
  }
}
