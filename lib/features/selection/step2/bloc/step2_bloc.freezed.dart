// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step2_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Step2Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Song> songs) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Song> songs)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Song> songs)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSongs value) fetch,
    required TResult Function(SaveSongs value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSongs value)? fetch,
    TResult? Function(SaveSongs value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSongs value)? fetch,
    TResult Function(SaveSongs value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Step2EventCopyWith<$Res> {
  factory $Step2EventCopyWith(
          Step2Event value, $Res Function(Step2Event) then) =
      _$Step2EventCopyWithImpl<$Res, Step2Event>;
}

/// @nodoc
class _$Step2EventCopyWithImpl<$Res, $Val extends Step2Event>
    implements $Step2EventCopyWith<$Res> {
  _$Step2EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchSongsImplCopyWith<$Res> {
  factory _$$FetchSongsImplCopyWith(
          _$FetchSongsImpl value, $Res Function(_$FetchSongsImpl) then) =
      __$$FetchSongsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSongsImplCopyWithImpl<$Res>
    extends _$Step2EventCopyWithImpl<$Res, _$FetchSongsImpl>
    implements _$$FetchSongsImplCopyWith<$Res> {
  __$$FetchSongsImplCopyWithImpl(
      _$FetchSongsImpl _value, $Res Function(_$FetchSongsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchSongsImpl implements FetchSongs {
  const _$FetchSongsImpl();

  @override
  String toString() {
    return 'Step2Event.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchSongsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Song> songs) save,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Song> songs)? save,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Song> songs)? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSongs value) fetch,
    required TResult Function(SaveSongs value) save,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSongs value)? fetch,
    TResult? Function(SaveSongs value)? save,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSongs value)? fetch,
    TResult Function(SaveSongs value)? save,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchSongs implements Step2Event {
  const factory FetchSongs() = _$FetchSongsImpl;
}

/// @nodoc
abstract class _$$SaveSongsImplCopyWith<$Res> {
  factory _$$SaveSongsImplCopyWith(
          _$SaveSongsImpl value, $Res Function(_$SaveSongsImpl) then) =
      __$$SaveSongsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Song> songs});
}

/// @nodoc
class __$$SaveSongsImplCopyWithImpl<$Res>
    extends _$Step2EventCopyWithImpl<$Res, _$SaveSongsImpl>
    implements _$$SaveSongsImplCopyWith<$Res> {
  __$$SaveSongsImplCopyWithImpl(
      _$SaveSongsImpl _value, $Res Function(_$SaveSongsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$SaveSongsImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
    ));
  }
}

/// @nodoc

class _$SaveSongsImpl implements SaveSongs {
  const _$SaveSongsImpl(final List<Song> songs) : _songs = songs;

  final List<Song> _songs;
  @override
  List<Song> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'Step2Event.save(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveSongsImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveSongsImplCopyWith<_$SaveSongsImpl> get copyWith =>
      __$$SaveSongsImplCopyWithImpl<_$SaveSongsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(List<Song> songs) save,
  }) {
    return save(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(List<Song> songs)? save,
  }) {
    return save?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(List<Song> songs)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchSongs value) fetch,
    required TResult Function(SaveSongs value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchSongs value)? fetch,
    TResult? Function(SaveSongs value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchSongs value)? fetch,
    TResult Function(SaveSongs value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class SaveSongs implements Step2Event {
  const factory SaveSongs(final List<Song> songs) = _$SaveSongsImpl;

  List<Song> get songs;
  @JsonKey(ignore: true)
  _$$SaveSongsImplCopyWith<_$SaveSongsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Step2State {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Step2StateCopyWith<$Res> {
  factory $Step2StateCopyWith(
          Step2State value, $Res Function(Step2State) then) =
      _$Step2StateCopyWithImpl<$Res, Step2State>;
}

/// @nodoc
class _$Step2StateCopyWithImpl<$Res, $Val extends Step2State>
    implements $Step2StateCopyWith<$Res> {
  _$Step2StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$Step2StateImplCopyWith<$Res> {
  factory _$$Step2StateImplCopyWith(
          _$Step2StateImpl value, $Res Function(_$Step2StateImpl) then) =
      __$$Step2StateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step2StateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2StateImpl>
    implements _$$Step2StateImplCopyWith<$Res> {
  __$$Step2StateImplCopyWithImpl(
      _$Step2StateImpl _value, $Res Function(_$Step2StateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step2StateImpl implements _Step2State {
  const _$Step2StateImpl();

  @override
  String toString() {
    return 'Step2State.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step2StateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Step2State implements Step2State {
  const factory _Step2State() = _$Step2StateImpl;
}

/// @nodoc
abstract class _$$Step2LoadedStateImplCopyWith<$Res> {
  factory _$$Step2LoadedStateImplCopyWith(_$Step2LoadedStateImpl value,
          $Res Function(_$Step2LoadedStateImpl) then) =
      __$$Step2LoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step2LoadedStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2LoadedStateImpl>
    implements _$$Step2LoadedStateImplCopyWith<$Res> {
  __$$Step2LoadedStateImplCopyWithImpl(_$Step2LoadedStateImpl _value,
      $Res Function(_$Step2LoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step2LoadedStateImpl implements Step2LoadedState {
  const _$Step2LoadedStateImpl();

  @override
  String toString() {
    return 'Step2State.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step2LoadedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Step2LoadedState implements Step2State {
  const factory Step2LoadedState() = _$Step2LoadedStateImpl;
}

/// @nodoc
abstract class _$$Step2ProgressStateImplCopyWith<$Res> {
  factory _$$Step2ProgressStateImplCopyWith(_$Step2ProgressStateImpl value,
          $Res Function(_$Step2ProgressStateImpl) then) =
      __$$Step2ProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step2ProgressStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2ProgressStateImpl>
    implements _$$Step2ProgressStateImplCopyWith<$Res> {
  __$$Step2ProgressStateImplCopyWithImpl(_$Step2ProgressStateImpl _value,
      $Res Function(_$Step2ProgressStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step2ProgressStateImpl implements Step2ProgressState {
  const _$Step2ProgressStateImpl();

  @override
  String toString() {
    return 'Step2State.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step2ProgressStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return progress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return progress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class Step2ProgressState implements Step2State {
  const factory Step2ProgressState() = _$Step2ProgressStateImpl;
}

/// @nodoc
abstract class _$$Step2SuccessStateImplCopyWith<$Res> {
  factory _$$Step2SuccessStateImplCopyWith(_$Step2SuccessStateImpl value,
          $Res Function(_$Step2SuccessStateImpl) then) =
      __$$Step2SuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step2SuccessStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2SuccessStateImpl>
    implements _$$Step2SuccessStateImplCopyWith<$Res> {
  __$$Step2SuccessStateImplCopyWithImpl(_$Step2SuccessStateImpl _value,
      $Res Function(_$Step2SuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step2SuccessStateImpl implements Step2SuccessState {
  const _$Step2SuccessStateImpl();

  @override
  String toString() {
    return 'Step2State.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step2SuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Step2SuccessState implements Step2State {
  const factory Step2SuccessState() = _$Step2SuccessStateImpl;
}

/// @nodoc
abstract class _$$Step2FetchedStateImplCopyWith<$Res> {
  factory _$$Step2FetchedStateImplCopyWith(_$Step2FetchedStateImpl value,
          $Res Function(_$Step2FetchedStateImpl) then) =
      __$$Step2FetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Song> songs});
}

/// @nodoc
class __$$Step2FetchedStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2FetchedStateImpl>
    implements _$$Step2FetchedStateImplCopyWith<$Res> {
  __$$Step2FetchedStateImplCopyWithImpl(_$Step2FetchedStateImpl _value,
      $Res Function(_$Step2FetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$Step2FetchedStateImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
    ));
  }
}

/// @nodoc

class _$Step2FetchedStateImpl implements Step2FetchedState {
  const _$Step2FetchedStateImpl(final List<Song> songs) : _songs = songs;

  final List<Song> _songs;
  @override
  List<Song> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'Step2State.fetched(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step2FetchedStateImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Step2FetchedStateImplCopyWith<_$Step2FetchedStateImpl> get copyWith =>
      __$$Step2FetchedStateImplCopyWithImpl<_$Step2FetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return fetched(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return fetched?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class Step2FetchedState implements Step2State {
  const factory Step2FetchedState(final List<Song> songs) =
      _$Step2FetchedStateImpl;

  List<Song> get songs;
  @JsonKey(ignore: true)
  _$$Step2FetchedStateImplCopyWith<_$Step2FetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Step2SavingStateImplCopyWith<$Res> {
  factory _$$Step2SavingStateImplCopyWith(_$Step2SavingStateImpl value,
          $Res Function(_$Step2SavingStateImpl) then) =
      __$$Step2SavingStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress, String feedback});
}

/// @nodoc
class __$$Step2SavingStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2SavingStateImpl>
    implements _$$Step2SavingStateImplCopyWith<$Res> {
  __$$Step2SavingStateImplCopyWithImpl(_$Step2SavingStateImpl _value,
      $Res Function(_$Step2SavingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? feedback = null,
  }) {
    return _then(_$Step2SavingStateImpl(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Step2SavingStateImpl implements Step2SavingState {
  const _$Step2SavingStateImpl(this.progress, this.feedback);

  @override
  final int progress;
  @override
  final String feedback;

  @override
  String toString() {
    return 'Step2State.saving(progress: $progress, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step2SavingStateImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Step2SavingStateImplCopyWith<_$Step2SavingStateImpl> get copyWith =>
      __$$Step2SavingStateImplCopyWithImpl<_$Step2SavingStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return saving(this.progress, feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return saving?.call(this.progress, feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this.progress, feedback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class Step2SavingState implements Step2State {
  const factory Step2SavingState(final int progress, final String feedback) =
      _$Step2SavingStateImpl;

  int get progress;
  String get feedback;
  @JsonKey(ignore: true)
  _$$Step2SavingStateImplCopyWith<_$Step2SavingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Step2SavedStateImplCopyWith<$Res> {
  factory _$$Step2SavedStateImplCopyWith(_$Step2SavedStateImpl value,
          $Res Function(_$Step2SavedStateImpl) then) =
      __$$Step2SavedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step2SavedStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2SavedStateImpl>
    implements _$$Step2SavedStateImplCopyWith<$Res> {
  __$$Step2SavedStateImplCopyWithImpl(
      _$Step2SavedStateImpl _value, $Res Function(_$Step2SavedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step2SavedStateImpl implements Step2SavedState {
  const _$Step2SavedStateImpl();

  @override
  String toString() {
    return 'Step2State.saved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step2SavedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Step2SavedState implements Step2State {
  const factory Step2SavedState() = _$Step2SavedStateImpl;
}

/// @nodoc
abstract class _$$Step2FailureStateImplCopyWith<$Res> {
  factory _$$Step2FailureStateImplCopyWith(_$Step2FailureStateImpl value,
          $Res Function(_$Step2FailureStateImpl) then) =
      __$$Step2FailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$Step2FailureStateImplCopyWithImpl<$Res>
    extends _$Step2StateCopyWithImpl<$Res, _$Step2FailureStateImpl>
    implements _$$Step2FailureStateImplCopyWith<$Res> {
  __$$Step2FailureStateImplCopyWithImpl(_$Step2FailureStateImpl _value,
      $Res Function(_$Step2FailureStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$Step2FailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Step2FailureStateImpl implements Step2FailureState {
  const _$Step2FailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'Step2State.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step2FailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Step2FailureStateImplCopyWith<_$Step2FailureStateImpl> get copyWith =>
      __$$Step2FailureStateImplCopyWithImpl<_$Step2FailureStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Song> songs) fetched,
    required TResult Function(int progress, String feedback) saving,
    required TResult Function() saved,
    required TResult Function(String feedback) failure,
  }) {
    return failure(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Song> songs)? fetched,
    TResult? Function(int progress, String feedback)? saving,
    TResult? Function()? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return failure?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Song> songs)? fetched,
    TResult Function(int progress, String feedback)? saving,
    TResult Function()? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(feedback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step2State value) initial,
    required TResult Function(Step2LoadedState value) loaded,
    required TResult Function(Step2ProgressState value) progress,
    required TResult Function(Step2SuccessState value) success,
    required TResult Function(Step2FetchedState value) fetched,
    required TResult Function(Step2SavingState value) saving,
    required TResult Function(Step2SavedState value) saved,
    required TResult Function(Step2FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step2State value)? initial,
    TResult? Function(Step2LoadedState value)? loaded,
    TResult? Function(Step2ProgressState value)? progress,
    TResult? Function(Step2SuccessState value)? success,
    TResult? Function(Step2FetchedState value)? fetched,
    TResult? Function(Step2SavingState value)? saving,
    TResult? Function(Step2SavedState value)? saved,
    TResult? Function(Step2FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step2State value)? initial,
    TResult Function(Step2LoadedState value)? loaded,
    TResult Function(Step2ProgressState value)? progress,
    TResult Function(Step2SuccessState value)? success,
    TResult Function(Step2FetchedState value)? fetched,
    TResult Function(Step2SavingState value)? saving,
    TResult Function(Step2SavedState value)? saved,
    TResult Function(Step2FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Step2FailureState implements Step2State {
  const factory Step2FailureState(final String feedback) =
      _$Step2FailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$Step2FailureStateImplCopyWith<_$Step2FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
