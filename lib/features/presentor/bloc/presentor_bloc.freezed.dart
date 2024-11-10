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
    required TResult Function(SongExt song) load,
    required TResult Function(SongExt song) like,
    required TResult Function(SongExt song) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? load,
    TResult? Function(SongExt song)? like,
    TResult? Function(SongExt song)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? load,
    TResult Function(SongExt song)? like,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSong value) load,
    required TResult Function(LikeSong value) like,
    required TResult Function(SaveHistory value) history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSong value)? load,
    TResult? Function(LikeSong value)? like,
    TResult? Function(SaveHistory value)? history,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSong value)? load,
    TResult Function(LikeSong value)? like,
    TResult Function(SaveHistory value)? history,
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
abstract class _$$LoadSongImplCopyWith<$Res>
    implements $PresentorEventCopyWith<$Res> {
  factory _$$LoadSongImplCopyWith(
          _$LoadSongImpl value, $Res Function(_$LoadSongImpl) then) =
      __$$LoadSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class __$$LoadSongImplCopyWithImpl<$Res>
    extends _$PresentorEventCopyWithImpl<$Res, _$LoadSongImpl>
    implements _$$LoadSongImplCopyWith<$Res> {
  __$$LoadSongImplCopyWithImpl(
      _$LoadSongImpl _value, $Res Function(_$LoadSongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$LoadSongImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ));
  }
}

/// @nodoc

class _$LoadSongImpl implements LoadSong {
  const _$LoadSongImpl(this.song);

  @override
  final SongExt song;

  @override
  String toString() {
    return 'PresentorEvent.load(song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSongImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSongImplCopyWith<_$LoadSongImpl> get copyWith =>
      __$$LoadSongImplCopyWithImpl<_$LoadSongImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) load,
    required TResult Function(SongExt song) like,
    required TResult Function(SongExt song) history,
  }) {
    return load(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? load,
    TResult? Function(SongExt song)? like,
    TResult? Function(SongExt song)? history,
  }) {
    return load?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? load,
    TResult Function(SongExt song)? like,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSong value) load,
    required TResult Function(LikeSong value) like,
    required TResult Function(SaveHistory value) history,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSong value)? load,
    TResult? Function(LikeSong value)? like,
    TResult? Function(SaveHistory value)? history,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSong value)? load,
    TResult Function(LikeSong value)? like,
    TResult Function(SaveHistory value)? history,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadSong implements PresentorEvent {
  const factory LoadSong(final SongExt song) = _$LoadSongImpl;

  @override
  SongExt get song;
  @override
  @JsonKey(ignore: true)
  _$$LoadSongImplCopyWith<_$LoadSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeSongImplCopyWith<$Res>
    implements $PresentorEventCopyWith<$Res> {
  factory _$$LikeSongImplCopyWith(
          _$LikeSongImpl value, $Res Function(_$LikeSongImpl) then) =
      __$$LikeSongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class __$$LikeSongImplCopyWithImpl<$Res>
    extends _$PresentorEventCopyWithImpl<$Res, _$LikeSongImpl>
    implements _$$LikeSongImplCopyWith<$Res> {
  __$$LikeSongImplCopyWithImpl(
      _$LikeSongImpl _value, $Res Function(_$LikeSongImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$LikeSongImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ));
  }
}

/// @nodoc

class _$LikeSongImpl implements LikeSong {
  const _$LikeSongImpl(this.song);

  @override
  final SongExt song;

  @override
  String toString() {
    return 'PresentorEvent.like(song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeSongImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeSongImplCopyWith<_$LikeSongImpl> get copyWith =>
      __$$LikeSongImplCopyWithImpl<_$LikeSongImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) load,
    required TResult Function(SongExt song) like,
    required TResult Function(SongExt song) history,
  }) {
    return like(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? load,
    TResult? Function(SongExt song)? like,
    TResult? Function(SongExt song)? history,
  }) {
    return like?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? load,
    TResult Function(SongExt song)? like,
    TResult Function(SongExt song)? history,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadSong value) load,
    required TResult Function(LikeSong value) like,
    required TResult Function(SaveHistory value) history,
  }) {
    return like(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSong value)? load,
    TResult? Function(LikeSong value)? like,
    TResult? Function(SaveHistory value)? history,
  }) {
    return like?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSong value)? load,
    TResult Function(LikeSong value)? like,
    TResult Function(SaveHistory value)? history,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(this);
    }
    return orElse();
  }
}

abstract class LikeSong implements PresentorEvent {
  const factory LikeSong(final SongExt song) = _$LikeSongImpl;

  @override
  SongExt get song;
  @override
  @JsonKey(ignore: true)
  _$$LikeSongImplCopyWith<_$LikeSongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveHistoryImplCopyWith<$Res>
    implements $PresentorEventCopyWith<$Res> {
  factory _$$SaveHistoryImplCopyWith(
          _$SaveHistoryImpl value, $Res Function(_$SaveHistoryImpl) then) =
      __$$SaveHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SongExt song});
}

/// @nodoc
class __$$SaveHistoryImplCopyWithImpl<$Res>
    extends _$PresentorEventCopyWithImpl<$Res, _$SaveHistoryImpl>
    implements _$$SaveHistoryImplCopyWith<$Res> {
  __$$SaveHistoryImplCopyWithImpl(
      _$SaveHistoryImpl _value, $Res Function(_$SaveHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$SaveHistoryImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongExt,
    ));
  }
}

/// @nodoc

class _$SaveHistoryImpl implements SaveHistory {
  const _$SaveHistoryImpl(this.song);

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
            other is _$SaveHistoryImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveHistoryImplCopyWith<_$SaveHistoryImpl> get copyWith =>
      __$$SaveHistoryImplCopyWithImpl<_$SaveHistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SongExt song) load,
    required TResult Function(SongExt song) like,
    required TResult Function(SongExt song) history,
  }) {
    return history(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SongExt song)? load,
    TResult? Function(SongExt song)? like,
    TResult? Function(SongExt song)? history,
  }) {
    return history?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SongExt song)? load,
    TResult Function(SongExt song)? like,
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
    required TResult Function(LoadSong value) load,
    required TResult Function(LikeSong value) like,
    required TResult Function(SaveHistory value) history,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadSong value)? load,
    TResult? Function(LikeSong value)? like,
    TResult? Function(SaveHistory value)? history,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadSong value)? load,
    TResult Function(LikeSong value)? like,
    TResult Function(SaveHistory value)? history,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class SaveHistory implements PresentorEvent {
  const factory SaveHistory(final SongExt song) = _$SaveHistoryImpl;

  @override
  SongExt get song;
  @override
  @JsonKey(ignore: true)
  _$$SaveHistoryImplCopyWith<_$SaveHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
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
abstract class _$$PresentorLoadedStateImplCopyWith<$Res> {
  factory _$$PresentorLoadedStateImplCopyWith(_$PresentorLoadedStateImpl value,
          $Res Function(_$PresentorLoadedStateImpl) then) =
      __$$PresentorLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String>? songVerses,
      List<Tab>? widgetTabs,
      List<Widget>? widgetContent});
}

/// @nodoc
class __$$PresentorLoadedStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorLoadedStateImpl>
    implements _$$PresentorLoadedStateImplCopyWith<$Res> {
  __$$PresentorLoadedStateImplCopyWithImpl(_$PresentorLoadedStateImpl _value,
      $Res Function(_$PresentorLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songVerses = freezed,
    Object? widgetTabs = freezed,
    Object? widgetContent = freezed,
  }) {
    return _then(_$PresentorLoadedStateImpl(
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

class _$PresentorLoadedStateImpl implements PresentorLoadedState {
  const _$PresentorLoadedStateImpl(final List<String>? songVerses,
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
            other is _$PresentorLoadedStateImpl &&
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
  _$$PresentorLoadedStateImplCopyWith<_$PresentorLoadedStateImpl>
      get copyWith =>
          __$$PresentorLoadedStateImplCopyWithImpl<_$PresentorLoadedStateImpl>(
              this, _$identity);

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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PresentorLoadedState implements PresentorState {
  const factory PresentorLoadedState(
      final List<String>? songVerses,
      final List<Tab>? widgetTabs,
      final List<Widget>? widgetContent) = _$PresentorLoadedStateImpl;

  List<String>? get songVerses;
  List<Tab>? get widgetTabs;
  List<Widget>? get widgetContent;
  @JsonKey(ignore: true)
  _$$PresentorLoadedStateImplCopyWith<_$PresentorLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresentorProgressStateImplCopyWith<$Res> {
  factory _$$PresentorProgressStateImplCopyWith(
          _$PresentorProgressStateImpl value,
          $Res Function(_$PresentorProgressStateImpl) then) =
      __$$PresentorProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresentorProgressStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorProgressStateImpl>
    implements _$$PresentorProgressStateImplCopyWith<$Res> {
  __$$PresentorProgressStateImplCopyWithImpl(
      _$PresentorProgressStateImpl _value,
      $Res Function(_$PresentorProgressStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PresentorProgressStateImpl implements PresentorProgressState {
  const _$PresentorProgressStateImpl();

  @override
  String toString() {
    return 'PresentorState.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentorProgressStateImpl);
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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class PresentorProgressState implements PresentorState {
  const factory PresentorProgressState() = _$PresentorProgressStateImpl;
}

/// @nodoc
abstract class _$$PresentorSuccessStateImplCopyWith<$Res> {
  factory _$$PresentorSuccessStateImplCopyWith(
          _$PresentorSuccessStateImpl value,
          $Res Function(_$PresentorSuccessStateImpl) then) =
      __$$PresentorSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresentorSuccessStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorSuccessStateImpl>
    implements _$$PresentorSuccessStateImplCopyWith<$Res> {
  __$$PresentorSuccessStateImplCopyWithImpl(_$PresentorSuccessStateImpl _value,
      $Res Function(_$PresentorSuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PresentorSuccessStateImpl implements PresentorSuccessState {
  const _$PresentorSuccessStateImpl();

  @override
  String toString() {
    return 'PresentorState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentorSuccessStateImpl);
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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PresentorSuccessState implements PresentorState {
  const factory PresentorSuccessState() = _$PresentorSuccessStateImpl;
}

/// @nodoc
abstract class _$$PresentorLikedStateImplCopyWith<$Res> {
  factory _$$PresentorLikedStateImplCopyWith(_$PresentorLikedStateImpl value,
          $Res Function(_$PresentorLikedStateImpl) then) =
      __$$PresentorLikedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool liked});
}

/// @nodoc
class __$$PresentorLikedStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorLikedStateImpl>
    implements _$$PresentorLikedStateImplCopyWith<$Res> {
  __$$PresentorLikedStateImplCopyWithImpl(_$PresentorLikedStateImpl _value,
      $Res Function(_$PresentorLikedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liked = null,
  }) {
    return _then(_$PresentorLikedStateImpl(
      null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PresentorLikedStateImpl implements PresentorLikedState {
  const _$PresentorLikedStateImpl(this.liked);

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
            other is _$PresentorLikedStateImpl &&
            (identical(other.liked, liked) || other.liked == liked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, liked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresentorLikedStateImplCopyWith<_$PresentorLikedStateImpl> get copyWith =>
      __$$PresentorLikedStateImplCopyWithImpl<_$PresentorLikedStateImpl>(
          this, _$identity);

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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return liked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return liked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (liked != null) {
      return liked(this);
    }
    return orElse();
  }
}

abstract class PresentorLikedState implements PresentorState {
  const factory PresentorLikedState(final bool liked) =
      _$PresentorLikedStateImpl;

  bool get liked;
  @JsonKey(ignore: true)
  _$$PresentorLikedStateImplCopyWith<_$PresentorLikedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresentorHistoryStateImplCopyWith<$Res> {
  factory _$$PresentorHistoryStateImplCopyWith(
          _$PresentorHistoryStateImpl value,
          $Res Function(_$PresentorHistoryStateImpl) then) =
      __$$PresentorHistoryStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresentorHistoryStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorHistoryStateImpl>
    implements _$$PresentorHistoryStateImplCopyWith<$Res> {
  __$$PresentorHistoryStateImplCopyWithImpl(_$PresentorHistoryStateImpl _value,
      $Res Function(_$PresentorHistoryStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PresentorHistoryStateImpl implements PresentorHistoryState {
  const _$PresentorHistoryStateImpl();

  @override
  String toString() {
    return 'PresentorState.history()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentorHistoryStateImpl);
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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return history(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return history?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (history != null) {
      return history(this);
    }
    return orElse();
  }
}

abstract class PresentorHistoryState implements PresentorState {
  const factory PresentorHistoryState() = _$PresentorHistoryStateImpl;
}

/// @nodoc
abstract class _$$PresentorFailureStateImplCopyWith<$Res> {
  factory _$$PresentorFailureStateImplCopyWith(
          _$PresentorFailureStateImpl value,
          $Res Function(_$PresentorFailureStateImpl) then) =
      __$$PresentorFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$PresentorFailureStateImplCopyWithImpl<$Res>
    extends _$PresentorStateCopyWithImpl<$Res, _$PresentorFailureStateImpl>
    implements _$$PresentorFailureStateImplCopyWith<$Res> {
  __$$PresentorFailureStateImplCopyWithImpl(_$PresentorFailureStateImpl _value,
      $Res Function(_$PresentorFailureStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$PresentorFailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PresentorFailureStateImpl implements PresentorFailureState {
  const _$PresentorFailureStateImpl(this.feedback);

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
            other is _$PresentorFailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresentorFailureStateImplCopyWith<_$PresentorFailureStateImpl>
      get copyWith => __$$PresentorFailureStateImplCopyWithImpl<
          _$PresentorFailureStateImpl>(this, _$identity);

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
    required TResult Function(PresentorLoadedState value) loaded,
    required TResult Function(PresentorProgressState value) progress,
    required TResult Function(PresentorSuccessState value) success,
    required TResult Function(PresentorLikedState value) liked,
    required TResult Function(PresentorHistoryState value) history,
    required TResult Function(PresentorFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PresentorState value)? initial,
    TResult? Function(PresentorLoadedState value)? loaded,
    TResult? Function(PresentorProgressState value)? progress,
    TResult? Function(PresentorSuccessState value)? success,
    TResult? Function(PresentorLikedState value)? liked,
    TResult? Function(PresentorHistoryState value)? history,
    TResult? Function(PresentorFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PresentorState value)? initial,
    TResult Function(PresentorLoadedState value)? loaded,
    TResult Function(PresentorProgressState value)? progress,
    TResult Function(PresentorSuccessState value)? success,
    TResult Function(PresentorLikedState value)? liked,
    TResult Function(PresentorHistoryState value)? history,
    TResult Function(PresentorFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PresentorFailureState implements PresentorState {
  const factory PresentorFailureState(final String feedback) =
      _$PresentorFailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$PresentorFailureStateImplCopyWith<_$PresentorFailureStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
