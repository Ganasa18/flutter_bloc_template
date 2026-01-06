// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocaleState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocaleState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocaleState()';
  }
}

/// @nodoc
class $LocaleStateCopyWith<$Res> {
  $LocaleStateCopyWith(LocaleState _, $Res Function(LocaleState) __);
}

/// Adds pattern-matching-related methods to [LocaleState].
extension LocaleStatePatterns on LocaleState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleInitialState value)? initial,
    TResult Function(_GetLocaleLoadingState value)? loading,
    TResult Function(_GetLocaleErrorState value)? error,
    TResult Function(_GetLocaleLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleInitialState() when initial != null:
        return initial(_that);
      case _GetLocaleLoadingState() when loading != null:
        return loading(_that);
      case _GetLocaleErrorState() when error != null:
        return error(_that);
      case _GetLocaleLoadedState() when loaded != null:
        return loaded(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleInitialState value) initial,
    required TResult Function(_GetLocaleLoadingState value) loading,
    required TResult Function(_GetLocaleErrorState value) error,
    required TResult Function(_GetLocaleLoadedState value) loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleInitialState():
        return initial(_that);
      case _GetLocaleLoadingState():
        return loading(_that);
      case _GetLocaleErrorState():
        return error(_that);
      case _GetLocaleLoadedState():
        return loaded(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleInitialState value)? initial,
    TResult? Function(_GetLocaleLoadingState value)? loading,
    TResult? Function(_GetLocaleErrorState value)? error,
    TResult? Function(_GetLocaleLoadedState value)? loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleInitialState() when initial != null:
        return initial(_that);
      case _GetLocaleLoadingState() when loading != null:
        return loading(_that);
      case _GetLocaleErrorState() when error != null:
        return error(_that);
      case _GetLocaleLoadedState() when loaded != null:
        return loaded(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Locale? locale)? loaded,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleInitialState() when initial != null:
        return initial();
      case _GetLocaleLoadingState() when loading != null:
        return loading();
      case _GetLocaleErrorState() when error != null:
        return error(_that.message);
      case _GetLocaleLoadedState() when loaded != null:
        return loaded(_that.locale);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Locale? locale) loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleInitialState():
        return initial();
      case _GetLocaleLoadingState():
        return loading();
      case _GetLocaleErrorState():
        return error(_that.message);
      case _GetLocaleLoadedState():
        return loaded(_that.locale);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Locale? locale)? loaded,
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleInitialState() when initial != null:
        return initial();
      case _GetLocaleLoadingState() when loading != null:
        return loading();
      case _GetLocaleErrorState() when error != null:
        return error(_that.message);
      case _GetLocaleLoadedState() when loaded != null:
        return loaded(_that.locale);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocaleInitialState implements LocaleState {
  const _LocaleInitialState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LocaleInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocaleState.initial()';
  }
}

/// @nodoc

class _GetLocaleLoadingState implements LocaleState {
  const _GetLocaleLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetLocaleLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocaleState.loading()';
  }
}

/// @nodoc

class _GetLocaleErrorState implements LocaleState {
  const _GetLocaleErrorState(this.message);

  final String message;

  /// Create a copy of LocaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetLocaleErrorStateCopyWith<_GetLocaleErrorState> get copyWith =>
      __$GetLocaleErrorStateCopyWithImpl<_GetLocaleErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetLocaleErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LocaleState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$GetLocaleErrorStateCopyWith<$Res>
    implements $LocaleStateCopyWith<$Res> {
  factory _$GetLocaleErrorStateCopyWith(_GetLocaleErrorState value,
          $Res Function(_GetLocaleErrorState) _then) =
      __$GetLocaleErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$GetLocaleErrorStateCopyWithImpl<$Res>
    implements _$GetLocaleErrorStateCopyWith<$Res> {
  __$GetLocaleErrorStateCopyWithImpl(this._self, this._then);

  final _GetLocaleErrorState _self;
  final $Res Function(_GetLocaleErrorState) _then;

  /// Create a copy of LocaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_GetLocaleErrorState(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _GetLocaleLoadedState implements LocaleState {
  const _GetLocaleLoadedState({required this.locale});

  final Locale? locale;

  /// Create a copy of LocaleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetLocaleLoadedStateCopyWith<_GetLocaleLoadedState> get copyWith =>
      __$GetLocaleLoadedStateCopyWithImpl<_GetLocaleLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetLocaleLoadedState &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @override
  String toString() {
    return 'LocaleState.loaded(locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$GetLocaleLoadedStateCopyWith<$Res>
    implements $LocaleStateCopyWith<$Res> {
  factory _$GetLocaleLoadedStateCopyWith(_GetLocaleLoadedState value,
          $Res Function(_GetLocaleLoadedState) _then) =
      __$GetLocaleLoadedStateCopyWithImpl;
  @useResult
  $Res call({Locale? locale});
}

/// @nodoc
class __$GetLocaleLoadedStateCopyWithImpl<$Res>
    implements _$GetLocaleLoadedStateCopyWith<$Res> {
  __$GetLocaleLoadedStateCopyWithImpl(this._self, this._then);

  final _GetLocaleLoadedState _self;
  final $Res Function(_GetLocaleLoadedState) _then;

  /// Create a copy of LocaleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_GetLocaleLoadedState(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

// dart format on
