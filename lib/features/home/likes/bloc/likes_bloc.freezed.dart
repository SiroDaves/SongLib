// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() books,
    required TResult Function(int book) likes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? books,
    TResult? Function(int book)? likes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? books,
    TResult Function(int book)? likes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) books,
    required TResult Function(FetchLikes value) likes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? books,
    TResult? Function(FetchLikes value)? likes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? books,
    TResult Function(FetchLikes value)? likes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesEventCopyWith<$Res> {
  factory $LikesEventCopyWith(
          LikesEvent value, $Res Function(LikesEvent) then) =
      _$LikesEventCopyWithImpl<$Res, LikesEvent>;
}

/// @nodoc
class _$LikesEventCopyWithImpl<$Res, $Val extends LikesEvent>
    implements $LikesEventCopyWith<$Res> {
  _$LikesEventCopyWithImpl(this._value, this._then);

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
    extends _$LikesEventCopyWithImpl<$Res, _$FetchBooksImpl>
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
    return 'LikesEvent.books()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LikesEvent.books'));
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
    required TResult Function(int book) likes,
  }) {
    return books();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? books,
    TResult? Function(int book)? likes,
  }) {
    return books?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? books,
    TResult Function(int book)? likes,
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
    required TResult Function(FetchLikes value) likes,
  }) {
    return books(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? books,
    TResult? Function(FetchLikes value)? likes,
  }) {
    return books?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? books,
    TResult Function(FetchLikes value)? likes,
    required TResult orElse(),
  }) {
    if (books != null) {
      return books(this);
    }
    return orElse();
  }
}

abstract class FetchBooks implements LikesEvent {
  const factory FetchBooks() = _$FetchBooksImpl;
}

/// @nodoc
abstract class _$$FetchLikesImplCopyWith<$Res> {
  factory _$$FetchLikesImplCopyWith(
          _$FetchLikesImpl value, $Res Function(_$FetchLikesImpl) then) =
      __$$FetchLikesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int book});
}

/// @nodoc
class __$$FetchLikesImplCopyWithImpl<$Res>
    extends _$LikesEventCopyWithImpl<$Res, _$FetchLikesImpl>
    implements _$$FetchLikesImplCopyWith<$Res> {
  __$$FetchLikesImplCopyWithImpl(
      _$FetchLikesImpl _value, $Res Function(_$FetchLikesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$FetchLikesImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchLikesImpl with DiagnosticableTreeMixin implements FetchLikes {
  const _$FetchLikesImpl(this.book);

  @override
  final int book;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikesEvent.likes(book: $book)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikesEvent.likes'))
      ..add(DiagnosticsProperty('book', book));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchLikesImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchLikesImplCopyWith<_$FetchLikesImpl> get copyWith =>
      __$$FetchLikesImplCopyWithImpl<_$FetchLikesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() books,
    required TResult Function(int book) likes,
  }) {
    return likes(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? books,
    TResult? Function(int book)? likes,
  }) {
    return likes?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? books,
    TResult Function(int book)? likes,
    required TResult orElse(),
  }) {
    if (likes != null) {
      return likes(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) books,
    required TResult Function(FetchLikes value) likes,
  }) {
    return likes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? books,
    TResult? Function(FetchLikes value)? likes,
  }) {
    return likes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? books,
    TResult Function(FetchLikes value)? likes,
    required TResult orElse(),
  }) {
    if (likes != null) {
      return likes(this);
    }
    return orElse();
  }
}

abstract class FetchLikes implements LikesEvent {
  const factory FetchLikes(final int book) = _$FetchLikesImpl;

  int get book;
  @JsonKey(ignore: true)
  _$$FetchLikesImplCopyWith<_$FetchLikesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LikesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> likes) likes,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> likes)? likes,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> likes)? likes,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesStateCopyWith<$Res> {
  factory $LikesStateCopyWith(
          LikesState value, $Res Function(LikesState) then) =
      _$LikesStateCopyWithImpl<$Res, LikesState>;
}

/// @nodoc
class _$LikesStateCopyWithImpl<$Res, $Val extends LikesState>
    implements $LikesStateCopyWith<$Res> {
  _$LikesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LikesStateImplCopyWith<$Res> {
  factory _$$LikesStateImplCopyWith(
          _$LikesStateImpl value, $Res Function(_$LikesStateImpl) then) =
      __$$LikesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LikesStateImplCopyWithImpl<$Res>
    extends _$LikesStateCopyWithImpl<$Res, _$LikesStateImpl>
    implements _$$LikesStateImplCopyWith<$Res> {
  __$$LikesStateImplCopyWithImpl(
      _$LikesStateImpl _value, $Res Function(_$LikesStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LikesStateImpl with DiagnosticableTreeMixin implements _LikesState {
  const _$LikesStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikesState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LikesState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LikesStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> likes) likes,
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
    TResult? Function(List<SongExt> likes)? likes,
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
    TResult Function(List<SongExt> likes)? likes,
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
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
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

abstract class _LikesState implements LikesState {
  const factory _LikesState() = _$LikesStateImpl;
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
    extends _$LikesStateCopyWithImpl<$Res, _$BooksFetchedStateImpl>
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
    return 'LikesState.books(books: $books)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikesState.books'))
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
    required TResult Function(List<SongExt> likes) likes,
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
    TResult? Function(List<SongExt> likes)? likes,
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
    TResult Function(List<SongExt> likes)? likes,
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
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return books(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return books?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
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

abstract class BooksFetchedState implements LikesState {
  const factory BooksFetchedState(final List<Book> books) =
      _$BooksFetchedStateImpl;

  List<Book> get books;
  @JsonKey(ignore: true)
  _$$BooksFetchedStateImplCopyWith<_$BooksFetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikesFetchedStateImplCopyWith<$Res> {
  factory _$$LikesFetchedStateImplCopyWith(_$LikesFetchedStateImpl value,
          $Res Function(_$LikesFetchedStateImpl) then) =
      __$$LikesFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongExt> likes});
}

/// @nodoc
class __$$LikesFetchedStateImplCopyWithImpl<$Res>
    extends _$LikesStateCopyWithImpl<$Res, _$LikesFetchedStateImpl>
    implements _$$LikesFetchedStateImplCopyWith<$Res> {
  __$$LikesFetchedStateImplCopyWithImpl(_$LikesFetchedStateImpl _value,
      $Res Function(_$LikesFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likes = null,
  }) {
    return _then(_$LikesFetchedStateImpl(
      null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<SongExt>,
    ));
  }
}

/// @nodoc

class _$LikesFetchedStateImpl
    with DiagnosticableTreeMixin
    implements LikesFetchedState {
  const _$LikesFetchedStateImpl(final List<SongExt> likes) : _likes = likes;

  final List<SongExt> _likes;
  @override
  List<SongExt> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LikesState.likes(likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikesState.likes'))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikesFetchedStateImpl &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikesFetchedStateImplCopyWith<_$LikesFetchedStateImpl> get copyWith =>
      __$$LikesFetchedStateImplCopyWithImpl<_$LikesFetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Book> books) books,
    required TResult Function(List<SongExt> likes) likes,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String feedback) failure,
  }) {
    return likes(this.likes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Book> books)? books,
    TResult? Function(List<SongExt> likes)? likes,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String feedback)? failure,
  }) {
    return likes?.call(this.likes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Book> books)? books,
    TResult Function(List<SongExt> likes)? likes,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (likes != null) {
      return likes(this.likes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return likes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return likes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (likes != null) {
      return likes(this);
    }
    return orElse();
  }
}

abstract class LikesFetchedState implements LikesState {
  const factory LikesFetchedState(final List<SongExt> likes) =
      _$LikesFetchedStateImpl;

  List<SongExt> get likes;
  @JsonKey(ignore: true)
  _$$LikesFetchedStateImplCopyWith<_$LikesFetchedStateImpl> get copyWith =>
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
    extends _$LikesStateCopyWithImpl<$Res, _$ProgressStateImpl>
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
    return 'LikesState.progress()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LikesState.progress'));
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
    required TResult Function(List<SongExt> likes) likes,
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
    TResult? Function(List<SongExt> likes)? likes,
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
    TResult Function(List<SongExt> likes)? likes,
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
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
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

abstract class ProgressState implements LikesState {
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
    extends _$LikesStateCopyWithImpl<$Res, _$SuccessStateImpl>
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
    return 'LikesState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LikesState.success'));
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
    required TResult Function(List<SongExt> likes) likes,
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
    TResult? Function(List<SongExt> likes)? likes,
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
    TResult Function(List<SongExt> likes)? likes,
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
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
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

abstract class SuccessState implements LikesState {
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
    extends _$LikesStateCopyWithImpl<$Res, _$FailureStateImpl>
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
    return 'LikesState.failure(feedback: $feedback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LikesState.failure'))
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
    required TResult Function(List<SongExt> likes) likes,
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
    TResult? Function(List<SongExt> likes)? likes,
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
    TResult Function(List<SongExt> likes)? likes,
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
    required TResult Function(_LikesState value) initial,
    required TResult Function(BooksFetchedState value) books,
    required TResult Function(LikesFetchedState value) likes,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LikesState value)? initial,
    TResult? Function(BooksFetchedState value)? books,
    TResult? Function(LikesFetchedState value)? likes,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikesState value)? initial,
    TResult Function(BooksFetchedState value)? books,
    TResult Function(LikesFetchedState value)? likes,
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

abstract class FailureState implements LikesState {
  const factory FailureState(final String feedback) = _$FailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
