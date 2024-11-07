// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SongsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() books,
    required TResult Function(int book) songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? books,
    TResult? Function(int book)? songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? books,
    TResult Function(int book)? songs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) books,
    required TResult Function(FetchSongs value) songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? books,
    TResult? Function(FetchSongs value)? songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? books,
    TResult Function(FetchSongs value)? songs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsEventCopyWith<$Res> {
  factory $SongsEventCopyWith(
          SongsEvent value, $Res Function(SongsEvent) then) =
      _$SongsEventCopyWithImpl<$Res, SongsEvent>;
}

/// @nodoc
class _$SongsEventCopyWithImpl<$Res, $Val extends SongsEvent>
    implements $SongsEventCopyWith<$Res> {
  _$SongsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchBooksImplCopyWith<$Res> {
  factory _$$FetchBooksImplCopyWith(
          _$FetchBooksImpl value, $Res Function(_$FetchBooksImpl) then) =
      __$$FetchBooksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBooksImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$FetchBooksImpl>
    implements _$$FetchBooksImplCopyWith<$Res> {
  __$$FetchBooksImplCopyWithImpl(
      _$FetchBooksImpl _value, $Res Function(_$FetchBooksImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchBooksImpl with DiagnosticableTreeMixin implements FetchBooks {
  const _$FetchBooksImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsEvent.books()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SongsEvent.books'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchBooksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() books,
    required TResult Function(int book) songs,
  }) {
    return books();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? books,
    TResult? Function(int book)? songs,
  }) {
    return books?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? books,
    TResult Function(int book)? songs,
    required TResult orElse(),
  }) {
    if (books != null) {
      return books();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) books,
    required TResult Function(FetchSongs value) songs,
  }) {
    return books(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? books,
    TResult? Function(FetchSongs value)? songs,
  }) {
    return books?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? books,
    TResult Function(FetchSongs value)? songs,
    required TResult orElse(),
  }) {
    if (books != null) {
      return books(this);
    }
    return orElse();
  }
}

abstract class FetchBooks implements SongsEvent {
  const factory FetchBooks() = _$FetchBooksImpl;
}

/// @nodoc
abstract class _$$FetchSongsImplCopyWith<$Res> {
  factory _$$FetchSongsImplCopyWith(
          _$FetchSongsImpl value, $Res Function(_$FetchSongsImpl) then) =
      __$$FetchSongsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int book});
}

/// @nodoc
class __$$FetchSongsImplCopyWithImpl<$Res>
    extends _$SongsEventCopyWithImpl<$Res, _$FetchSongsImpl>
    implements _$$FetchSongsImplCopyWith<$Res> {
  __$$FetchSongsImplCopyWithImpl(
      _$FetchSongsImpl _value, $Res Function(_$FetchSongsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$FetchSongsImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchSongsImpl with DiagnosticableTreeMixin implements FetchSongs {
  const _$FetchSongsImpl(this.book);

  @override
  final int book;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsEvent.songs(book: $book)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SongsEvent.songs'))
      ..add(DiagnosticsProperty('book', book));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSongsImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchSongsImplCopyWith<_$FetchSongsImpl> get copyWith =>
      __$$FetchSongsImplCopyWithImpl<_$FetchSongsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() books,
    required TResult Function(int book) songs,
  }) {
    return songs(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? books,
    TResult? Function(int book)? songs,
  }) {
    return songs?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? books,
    TResult Function(int book)? songs,
    required TResult orElse(),
  }) {
    if (songs != null) {
      return songs(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) books,
    required TResult Function(FetchSongs value) songs,
  }) {
    return songs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? books,
    TResult? Function(FetchSongs value)? songs,
  }) {
    return songs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? books,
    TResult Function(FetchSongs value)? songs,
    required TResult orElse(),
  }) {
    if (songs != null) {
      return songs(this);
    }
    return orElse();
  }
}

abstract class FetchSongs implements SongsEvent {
  const factory FetchSongs(final int book) = _$FetchSongsImpl;

  int get book;
  @JsonKey(ignore: true)
  _$$FetchSongsImplCopyWith<_$FetchSongsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsStateCopyWith<$Res> {
  factory $SongsStateCopyWith(
          SongsState value, $Res Function(SongsState) then) =
      _$SongsStateCopyWithImpl<$Res, SongsState>;
}

/// @nodoc
class _$SongsStateCopyWithImpl<$Res, $Val extends SongsState>
    implements $SongsStateCopyWith<$Res> {
  _$SongsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SongsStateImplCopyWith<$Res> {
  factory _$$SongsStateImplCopyWith(
          _$SongsStateImpl value, $Res Function(_$SongsStateImpl) then) =
      __$$SongsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SongsStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$SongsStateImpl>
    implements _$$SongsStateImplCopyWith<$Res> {
  __$$SongsStateImplCopyWithImpl(
      _$SongsStateImpl _value, $Res Function(_$SongsStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SongsStateImpl with DiagnosticableTreeMixin implements _SongsState {
  const _$SongsStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SongsState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SongsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
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
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SongsState implements SongsState {
  const factory _SongsState() = _$SongsStateImpl;
}

/// @nodoc
abstract class _$$BooksFetchedStateImplCopyWith<$Res> {
  factory _$$BooksFetchedStateImplCopyWith(_$BooksFetchedStateImpl value,
          $Res Function(_$BooksFetchedStateImpl) then) =
      __$$BooksFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> books});
}

/// @nodoc
class __$$BooksFetchedStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$BooksFetchedStateImpl>
    implements _$$BooksFetchedStateImplCopyWith<$Res> {
  __$$BooksFetchedStateImplCopyWithImpl(_$BooksFetchedStateImpl _value,
      $Res Function(_$BooksFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
  }) {
    return _then(_$BooksFetchedStateImpl(
      null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$BooksFetchedStateImpl
    with DiagnosticableTreeMixin
    implements BooksFetchedState {
  const _$BooksFetchedStateImpl(final List<Book> books) : _books = books;

  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsState.books(books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SongsState.books'))
      ..add(DiagnosticsProperty('books', books));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksFetchedStateImpl &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksFetchedStateImplCopyWith<_$BooksFetchedStateImpl> get copyWith =>
      __$$BooksFetchedStateImplCopyWithImpl<_$BooksFetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return books(this.books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return books?.call(this.books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (books != null) {
      return books(this.books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return books(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return books?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (books != null) {
      return books(this);
    }
    return orElse();
  }
}

abstract class BooksFetchedState implements SongsState {
  const factory BooksFetchedState(final List<Book> books) =
      _$BooksFetchedStateImpl;

  List<Book> get books;
  @JsonKey(ignore: true)
  _$$BooksFetchedStateImplCopyWith<_$BooksFetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SongsFetchedStateImplCopyWith<$Res> {
  factory _$$SongsFetchedStateImplCopyWith(_$SongsFetchedStateImpl value,
          $Res Function(_$SongsFetchedStateImpl) then) =
      __$$SongsFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongExt> songs});
}

/// @nodoc
class __$$SongsFetchedStateImplCopyWithImpl<$Res>
    extends _$SongsStateCopyWithImpl<$Res, _$SongsFetchedStateImpl>
    implements _$$SongsFetchedStateImplCopyWith<$Res> {
  __$$SongsFetchedStateImplCopyWithImpl(_$SongsFetchedStateImpl _value,
      $Res Function(_$SongsFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$SongsFetchedStateImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongExt>,
    ));
  }
}

/// @nodoc

class _$SongsFetchedStateImpl
    with DiagnosticableTreeMixin
    implements SongsFetchedState {
  const _$SongsFetchedStateImpl(final List<SongExt> songs) : _songs = songs;

  final List<SongExt> _songs;
  @override
  List<SongExt> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsState.songs(songs: $songs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SongsState.songs'))
      ..add(DiagnosticsProperty('songs', songs));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongsFetchedStateImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongsFetchedStateImplCopyWith<_$SongsFetchedStateImpl> get copyWith =>
      __$$SongsFetchedStateImplCopyWithImpl<_$SongsFetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return songs(this.songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return songs?.call(this.songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (songs != null) {
      return songs(this.songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return songs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return songs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (songs != null) {
      return songs(this);
    }
    return orElse();
  }
}

abstract class SongsFetchedState implements SongsState {
  const factory SongsFetchedState(final List<SongExt> songs) =
      _$SongsFetchedStateImpl;

  List<SongExt> get songs;
  @JsonKey(ignore: true)
  _$$SongsFetchedStateImplCopyWith<_$SongsFetchedStateImpl> get copyWith =>
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
    extends _$SongsStateCopyWithImpl<$Res, _$ProgressStateImpl>
    implements _$$ProgressStateImplCopyWith<$Res> {
  __$$ProgressStateImplCopyWithImpl(
      _$ProgressStateImpl _value, $Res Function(_$ProgressStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProgressStateImpl
    with DiagnosticableTreeMixin
    implements ProgressState {
  const _$ProgressStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsState.progress()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SongsState.progress'));
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
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return progress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return progress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
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
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ProgressState implements SongsState {
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
    extends _$SongsStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessStateImpl with DiagnosticableTreeMixin implements SuccessState {
  const _$SuccessStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SongsState.success'));
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
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
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
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements SongsState {
  const factory SuccessState() = _$SuccessStateImpl;
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
    extends _$SongsStateCopyWithImpl<$Res, _$FailureStateImpl>
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

class _$FailureStateImpl with DiagnosticableTreeMixin implements FailureState {
  const _$FailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SongsState.failure(feedback: $feedback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SongsState.failure'))
      ..add(DiagnosticsProperty('feedback', feedback));
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
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> songs) songs,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return failure(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> songs)? songs,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return failure?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> songs)? songs,
    TResult Function()? progress,
    TResult Function()? success,
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
    required TResult Function(_SongsState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(SongsFetchedState value) songs,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SongsState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(SongsFetchedState value)? songs,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SongsState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(SongsFetchedState value)? songs,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureState implements SongsState {
  const factory FailureState(final String feedback) = _$FailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
