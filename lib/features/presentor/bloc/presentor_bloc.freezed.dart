// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PresentorEvent {
  SongExt get song => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) loadSong,
    required TResult Function(SongExt song) likeSong,
    required TResult Function(SongExt song) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? loadSong,
    TResult? Function(SongExt song)? likeSong,
    TResult? Function(SongExt song)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? loadSong,
    TResult Function(SongExt song)? likeSong,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PresentorLoadSong value) loadSong,
    required TResult Function(PresentorLikeSong value) likeSong,
    required TResult Function(PresentorSaveHistory value) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PresentorLoadSong value)? loadSong,
    TResult? Function(PresentorLikeSong value)? likeSong,
    TResult? Function(PresentorSaveHistory value)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PresentorLoadSong value)? loadSong,
    TResult Function(PresentorLikeSong value)? likeSong,
    TResult Function(PresentorSaveHistory value)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PresentorEventCopyWith<PresentorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresentorEventCopyWith<$Res> {
  factory $PresentorEventCopyWith(
          PresentorEvent value, $Res Function(PresentorEvent) then) =
      _$PresentorEventCopyWithImpl<$Res, PresentorEvent>;
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class _$PresentorEventCopyWithImpl<$Res, $Val extends PresentorEvent>
    implements $PresentorEventCopyWith<$Res> {
  _$PresentorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_value.copyWith(
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresentorLoadSongImplCopyWith<$Res>
    implements $PresentorEventCopyWith<$Res> {
  factory _$$PresentorLoadSongImplCopyWith(_$PresentorLoadSongImpl value,
          $Res Function(_$PresentorLoadSongImpl) then) =
      __$$PresentorLoadSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class __$$PresentorLoadSongImplCopyWithImpl<$Res>
    extends _$PresentorEventCopyWithImpl<$Res, _$PresentorLoadSongImpl>
    implements _$$PresentorLoadSongImplCopyWith<$Res> {
  __$$PresentorLoadSongImplCopyWithImpl(_$PresentorLoadSongImpl _value,
      $Res Function(_$PresentorLoadSongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$PresentorLoadSongImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ));
  }
}

/// @nodoc

class _$PresentorLoadSongImpl implements PresentorLoadSong {
  const _$PresentorLoadSongImpl(this.song);

  @override
  final SongExt song;

  @override
  String toString() {
    return 'PresentorEvent.loadSong(song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentorLoadSongImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresentorLoadSongImplCopyWith<_$PresentorLoadSongImpl> get copyWith =>
      __$$PresentorLoadSongImplCopyWithImpl<_$PresentorLoadSongImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) loadSong,
    required TResult Function(SongExt song) likeSong,
    required TResult Function(SongExt song) history,
  }) {
    return loadSong(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? loadSong,
    TResult? Function(SongExt song)? likeSong,
    TResult? Function(SongExt song)? history,
  }) {
    return loadSong?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? loadSong,
    TResult Function(SongExt song)? likeSong,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) {
    if (loadSong != null) {
      return loadSong(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PresentorLoadSong value) loadSong,
    required TResult Function(PresentorLikeSong value) likeSong,
    required TResult Function(PresentorSaveHistory value) history,
  }) {
    return loadSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PresentorLoadSong value)? loadSong,
    TResult? Function(PresentorLikeSong value)? likeSong,
    TResult? Function(PresentorSaveHistory value)? history,
  }) {
    return loadSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PresentorLoadSong value)? loadSong,
    TResult Function(PresentorLikeSong value)? likeSong,
    TResult Function(PresentorSaveHistory value)? history,
    required TResult orElse(),
  }) {
    if (loadSong != null) {
      return loadSong(this);
    }
    return orElse();
  }
}

abstract class PresentorLoadSong implements PresentorEvent {
  const factory PresentorLoadSong(final SongExt song) = _$PresentorLoadSongImpl;

  @override
  SongExt get song;
  @override
  @JsonKey(ignore: true)
  _$$PresentorLoadSongImplCopyWith<_$PresentorLoadSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresentorLikeSongImplCopyWith<$Res>
    implements $PresentorEventCopyWith<$Res> {
  factory _$$PresentorLikeSongImplCopyWith(_$PresentorLikeSongImpl value,
          $Res Function(_$PresentorLikeSongImpl) then) =
      __$$PresentorLikeSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class __$$PresentorLikeSongImplCopyWithImpl<$Res>
    extends _$PresentorEventCopyWithImpl<$Res, _$PresentorLikeSongImpl>
    implements _$$PresentorLikeSongImplCopyWith<$Res> {
  __$$PresentorLikeSongImplCopyWithImpl(_$PresentorLikeSongImpl _value,
      $Res Function(_$PresentorLikeSongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$PresentorLikeSongImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ));
  }
}

/// @nodoc

class _$PresentorLikeSongImpl implements PresentorLikeSong {
  const _$PresentorLikeSongImpl(this.song);

  @override
  final SongExt song;

  @override
  String toString() {
    return 'PresentorEvent.likeSong(song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentorLikeSongImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresentorLikeSongImplCopyWith<_$PresentorLikeSongImpl> get copyWith =>
      __$$PresentorLikeSongImplCopyWithImpl<_$PresentorLikeSongImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) loadSong,
    required TResult Function(SongExt song) likeSong,
    required TResult Function(SongExt song) history,
  }) {
    return likeSong(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? loadSong,
    TResult? Function(SongExt song)? likeSong,
    TResult? Function(SongExt song)? history,
  }) {
    return likeSong?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? loadSong,
    TResult Function(SongExt song)? likeSong,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) {
    if (likeSong != null) {
      return likeSong(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PresentorLoadSong value) loadSong,
    required TResult Function(PresentorLikeSong value) likeSong,
    required TResult Function(PresentorSaveHistory value) history,
  }) {
    return likeSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PresentorLoadSong value)? loadSong,
    TResult? Function(PresentorLikeSong value)? likeSong,
    TResult? Function(PresentorSaveHistory value)? history,
  }) {
    return likeSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PresentorLoadSong value)? loadSong,
    TResult Function(PresentorLikeSong value)? likeSong,
    TResult Function(PresentorSaveHistory value)? history,
    required TResult orElse(),
  }) {
    if (likeSong != null) {
      return likeSong(this);
    }
    return orElse();
  }
}

abstract class PresentorLikeSong implements PresentorEvent {
  const factory PresentorLikeSong(final SongExt song) = _$PresentorLikeSongImpl;

  @override
  SongExt get song;
  @override
  @JsonKey(ignore: true)
  _$$PresentorLikeSongImplCopyWith<_$PresentorLikeSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresentorSaveHistoryImplCopyWith<$Res>
    implements $PresentorEventCopyWith<$Res> {
  factory _$$PresentorSaveHistoryImplCopyWith(_$PresentorSaveHistoryImpl value,
          $Res Function(_$PresentorSaveHistoryImpl) then) =
      __$$PresentorSaveHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class __$$PresentorSaveHistoryImplCopyWithImpl<$Res>
    extends _$PresentorEventCopyWithImpl<$Res, _$PresentorSaveHistoryImpl>
    implements _$$PresentorSaveHistoryImplCopyWith<$Res> {
  __$$PresentorSaveHistoryImplCopyWithImpl(_$PresentorSaveHistoryImpl _value,
      $Res Function(_$PresentorSaveHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$PresentorSaveHistoryImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ));
  }
}

/// @nodoc

class _$PresentorSaveHistoryImpl implements PresentorSaveHistory {
  const _$PresentorSaveHistoryImpl(this.song);

  @override
  final SongExt song;

  @override
  String toString() {
    return 'PresentorEvent.history(song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentorSaveHistoryImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresentorSaveHistoryImplCopyWith<_$PresentorSaveHistoryImpl>
      get copyWith =>
          __$$PresentorSaveHistoryImplCopyWithImpl<_$PresentorSaveHistoryImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) loadSong,
    required TResult Function(SongExt song) likeSong,
    required TResult Function(SongExt song) history,
  }) {
    return history(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? loadSong,
    TResult? Function(SongExt song)? likeSong,
    TResult? Function(SongExt song)? history,
  }) {
    return history?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? loadSong,
    TResult Function(SongExt song)? likeSong,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PresentorLoadSong value) loadSong,
    required TResult Function(PresentorLikeSong value) likeSong,
    required TResult Function(PresentorSaveHistory value) history,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PresentorLoadSong value)? loadSong,
    TResult? Function(PresentorLikeSong value)? likeSong,
    TResult? Function(PresentorSaveHistory value)? history,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PresentorLoadSong value)? loadSong,
    TResult Function(PresentorLikeSong value)? likeSong,
    TResult Function(PresentorSaveHistory value)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class PresentorSaveHistory implements PresentorEvent {
  const factory PresentorSaveHistory(final SongExt song) =
      _$PresentorSaveHistoryImpl;

  @override
  SongExt get song;
  @override
  @JsonKey(ignore: true)
  _$$PresentorSaveHistoryImplCopyWith<_$PresentorSaveHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PresentorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresentorStateCopyWith<$Res> {
  factory $PresentorStateCopyWith(
          PresentorState value, $Res Function(PresentorState) then) =
      _$PresentorStateCopyWithImpl<$Res, PresentorState>;
}

/// @nodoc
class _$PresentorStateCopyWithImpl<$Res, $Val extends PresentorState>
    implements $PresentorStateCopyWith<$Res> {
  _$PresentorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PresentorStateImplCopyWith<$Res> {
  factory _$$PresentorStateImplCopyWith(_$PresentorStateImpl value,
          $Res Function(_$PresentorStateImpl) then) =
      __$$PresentorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresentorStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorStateImpl>
    implements _$$PresentorStateImplCopyWith<$Res> {
  __$$PresentorStateImplCopyWithImpl(
      _$PresentorStateImpl _value, $Res Function(_$PresentorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PresentorStateImpl implements _PresentorState {
  const _$PresentorStateImpl();

  @override
  String toString() {
    return 'PresentorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PresentorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
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
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PresentorState implements PresentorState {
  const factory _PresentorState() = _$PresentorStateImpl;
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String>? songVerses,
      List<Tab>? widgetTabs,
      List<Widget>? widgetContent});
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songVerses = freezed,
    Object? widgetTabs = freezed,
    Object? widgetContent = freezed,
  }) {
    return _then(_$LoadedStateImpl(
      freezed == songVerses
          ? _value._songVerses
          : songVerses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freezed == widgetTabs
          ? _value._widgetTabs
          : widgetTabs // ignore: cast_nullable_to_non_nullable
              as List<Tab>?,
      freezed == widgetContent
          ? _value._widgetContent
          : widgetContent // ignore: cast_nullable_to_non_nullable
              as List<Widget>?,
    ));
  }
}

/// @nodoc

class _$LoadedStateImpl implements LoadedState {
  const _$LoadedStateImpl(final List<String>? songVerses,
      final List<Tab>? widgetTabs, final List<Widget>? widgetContent)
      : _songVerses = songVerses,
        _widgetTabs = widgetTabs,
        _widgetContent = widgetContent;

  final List<String>? _songVerses;
  @override
  List<String>? get songVerses {
    final value = _songVerses;
    if (value == null) return null;
    if (_songVerses is EqualUnmodifiableListView) return _songVerses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tab>? _widgetTabs;
  @override
  List<Tab>? get widgetTabs {
    final value = _widgetTabs;
    if (value == null) return null;
    if (_widgetTabs is EqualUnmodifiableListView) return _widgetTabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Widget>? _widgetContent;
  @override
  List<Widget>? get widgetContent {
    final value = _widgetContent;
    if (value == null) return null;
    if (_widgetContent is EqualUnmodifiableListView) return _widgetContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PresentorState.loaded(songVerses: $songVerses, widgetTabs: $widgetTabs, widgetContent: $widgetContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._songVerses, _songVerses) &&
            const DeepCollectionEquality()
                .equals(other._widgetTabs, _widgetTabs) &&
            const DeepCollectionEquality()
                .equals(other._widgetContent, _widgetContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_songVerses),
      const DeepCollectionEquality().hash(_widgetTabs),
      const DeepCollectionEquality().hash(_widgetContent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      __$$LoadedStateImplCopyWithImpl<_$LoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return loaded(songVerses, widgetTabs, widgetContent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return loaded?.call(songVerses, widgetTabs, widgetContent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(songVerses, widgetTabs, widgetContent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements PresentorState {
  const factory LoadedState(
      final List<String>? songVerses,
      final List<Tab>? widgetTabs,
      final List<Widget>? widgetContent) = _$LoadedStateImpl;

  List<String>? get songVerses;
  List<Tab>? get widgetTabs;
  List<Widget>? get widgetContent;
  @JsonKey(ignore: true)
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProgressStateImplCopyWith<$Res> {
  factory _$$ProgressStateImplCopyWith(
          _$ProgressStateImpl value, $Res Function(_$ProgressStateImpl) then) =
      __$$ProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProgressStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$ProgressStateImpl>
    implements _$$ProgressStateImplCopyWith<$Res> {
  __$$ProgressStateImplCopyWithImpl(
      _$ProgressStateImpl _value, $Res Function(_$ProgressStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProgressStateImpl implements ProgressState {
  const _$ProgressStateImpl();

  @override
  String toString() {
    return 'PresentorState.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProgressStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return progress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return progress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
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
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ProgressState implements PresentorState {
  const factory ProgressState() = _$ProgressStateImpl;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
          _$SuccessStateImpl value, $Res Function(_$SuccessStateImpl) then) =
      __$$SuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessStateImpl implements SuccessState {
  const _$SuccessStateImpl();

  @override
  String toString() {
    return 'PresentorState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
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
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements PresentorState {
  const factory SuccessState() = _$SuccessStateImpl;
}

/// @nodoc
abstract class _$$LikedStateImplCopyWith<$Res> {
  factory _$$LikedStateImplCopyWith(
          _$LikedStateImpl value, $Res Function(_$LikedStateImpl) then) =
      __$$LikedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool liked});
}

/// @nodoc
class __$$LikedStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$LikedStateImpl>
    implements _$$LikedStateImplCopyWith<$Res> {
  __$$LikedStateImplCopyWithImpl(
      _$LikedStateImpl _value, $Res Function(_$LikedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liked = null,
  }) {
    return _then(_$LikedStateImpl(
      null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LikedStateImpl implements LikedState {
  const _$LikedStateImpl(this.liked);

  @override
  final bool liked;

  @override
  String toString() {
    return 'PresentorState.liked(liked: $liked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedStateImpl &&
            (identical(other.liked, liked) || other.liked == liked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, liked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedStateImplCopyWith<_$LikedStateImpl> get copyWith =>
      __$$LikedStateImplCopyWithImpl<_$LikedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return liked(this.liked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return liked?.call(this.liked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (liked != null) {
      return liked(this.liked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return liked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return liked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (liked != null) {
      return liked(this);
    }
    return orElse();
  }
}

abstract class LikedState implements PresentorState {
  const factory LikedState(final bool liked) = _$LikedStateImpl;

  bool get liked;
  @JsonKey(ignore: true)
  _$$LikedStateImplCopyWith<_$LikedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HistoryStateImpl implements HistoryState {
  const _$HistoryStateImpl();

  @override
  String toString() {
    return 'PresentorState.history()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HistoryStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return history();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return history?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class HistoryState implements PresentorState {
  const factory HistoryState() = _$HistoryStateImpl;
}

/// @nodoc
abstract class _$$FailureStateImplCopyWith<$Res> {
  factory _$$FailureStateImplCopyWith(
          _$FailureStateImpl value, $Res Function(_$FailureStateImpl) then) =
      __$$FailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$FailureStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$FailureStateImpl>
    implements _$$FailureStateImplCopyWith<$Res> {
  __$$FailureStateImplCopyWithImpl(
      _$FailureStateImpl _value, $Res Function(_$FailureStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$FailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureStateImpl implements FailureState {
  const _$FailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'PresentorState.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      __$$FailureStateImplCopyWithImpl<_$FailureStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)
        loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool liked) liked,
    required TResult Function() history,
    required TResult Function(String feedback) failure,
  }) {
    return failure(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool liked)? liked,
    TResult? Function()? history,
    TResult? Function(String feedback)? failure,
  }) {
    return failure?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<String>? songVerses, List<Tab>? widgetTabs,
            List<Widget>? widgetContent)?
        loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool liked)? liked,
    TResult Function()? history,
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
    required TResult Function(_PresentorState value) initial,
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(LikedState value) liked,
    required TResult Function(HistoryState value) history,
    required TResult Function(FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(LikedState value)? liked,
    TResult? Function(HistoryState value)? history,
    TResult? Function(FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(LikedState value)? liked,
    TResult Function(HistoryState value)? history,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureState implements PresentorState {
  const factory FailureState(final String feedback) = _$FailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
