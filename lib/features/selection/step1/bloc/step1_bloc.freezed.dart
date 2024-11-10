// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step1_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Step1Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String selectedBooksIds, List<Book> books) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String selectedBooksIds, List<Book> books)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String selectedBooksIds, List<Book> books)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) fetch,
    required TResult Function(SaveBooks value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? fetch,
    TResult? Function(SaveBooks value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? fetch,
    TResult Function(SaveBooks value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Step1EventCopyWith<$Res> {
  factory $Step1EventCopyWith(
          Step1Event value, $Res Function(Step1Event) then) =
      _$Step1EventCopyWithImpl<$Res, Step1Event>;
}

/// @nodoc
class _$Step1EventCopyWithImpl<$Res, $Val extends Step1Event>
    implements $Step1EventCopyWith<$Res> {
  _$Step1EventCopyWithImpl(this._value, this._then);

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
    extends _$Step1EventCopyWithImpl<$Res, _$FetchBooksImpl>
    implements _$$FetchBooksImplCopyWith<$Res> {
  __$$FetchBooksImplCopyWithImpl(
      _$FetchBooksImpl _value, $Res Function(_$FetchBooksImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchBooksImpl implements FetchBooks {
  const _$FetchBooksImpl();

  @override
  String toString() {
    return 'Step1Event.fetch()';
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
    required TResult Function() fetch,
    required TResult Function(String selectedBooksIds, List<Book> books) submit,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String selectedBooksIds, List<Book> books)? submit,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String selectedBooksIds, List<Book> books)? submit,
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
    required TResult Function(FetchBooks value) fetch,
    required TResult Function(SaveBooks value) submit,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? fetch,
    TResult? Function(SaveBooks value)? submit,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? fetch,
    TResult Function(SaveBooks value)? submit,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchBooks implements Step1Event {
  const factory FetchBooks() = _$FetchBooksImpl;
}

/// @nodoc
abstract class _$$SaveBooksImplCopyWith<$Res> {
  factory _$$SaveBooksImplCopyWith(
          _$SaveBooksImpl value, $Res Function(_$SaveBooksImpl) then) =
      __$$SaveBooksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedBooksIds, List<Book> books});
}

/// @nodoc
class __$$SaveBooksImplCopyWithImpl<$Res>
    extends _$Step1EventCopyWithImpl<$Res, _$SaveBooksImpl>
    implements _$$SaveBooksImplCopyWith<$Res> {
  __$$SaveBooksImplCopyWithImpl(
      _$SaveBooksImpl _value, $Res Function(_$SaveBooksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBooksIds = null,
    Object? books = null,
  }) {
    return _then(_$SaveBooksImpl(
      null == selectedBooksIds
          ? _value.selectedBooksIds
          : selectedBooksIds // ignore: cast_nullable_to_non_nullable
              as String,
      null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc

class _$SaveBooksImpl implements SaveBooks {
  const _$SaveBooksImpl(this.selectedBooksIds, final List<Book> books)
      : _books = books;

  @override
  final String selectedBooksIds;
  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'Step1Event.submit(selectedBooksIds: $selectedBooksIds, books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveBooksImpl &&
            (identical(other.selectedBooksIds, selectedBooksIds) ||
                other.selectedBooksIds == selectedBooksIds) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedBooksIds,
      const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveBooksImplCopyWith<_$SaveBooksImpl> get copyWith =>
      __$$SaveBooksImplCopyWithImpl<_$SaveBooksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String selectedBooksIds, List<Book> books) submit,
  }) {
    return submit(selectedBooksIds, books);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String selectedBooksIds, List<Book> books)? submit,
  }) {
    return submit?.call(selectedBooksIds, books);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String selectedBooksIds, List<Book> books)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(selectedBooksIds, books);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBooks value) fetch,
    required TResult Function(SaveBooks value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBooks value)? fetch,
    TResult? Function(SaveBooks value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBooks value)? fetch,
    TResult Function(SaveBooks value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class SaveBooks implements Step1Event {
  const factory SaveBooks(
      final String selectedBooksIds, final List<Book> books) = _$SaveBooksImpl;

  String get selectedBooksIds;
  List<Book> get books;
  @JsonKey(ignore: true)
  _$$SaveBooksImplCopyWith<_$SaveBooksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Step1State {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Step1StateCopyWith<$Res> {
  factory $Step1StateCopyWith(
          Step1State value, $Res Function(Step1State) then) =
      _$Step1StateCopyWithImpl<$Res, Step1State>;
}

/// @nodoc
class _$Step1StateCopyWithImpl<$Res, $Val extends Step1State>
    implements $Step1StateCopyWith<$Res> {
  _$Step1StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$Step1StateImplCopyWith<$Res> {
  factory _$$Step1StateImplCopyWith(
          _$Step1StateImpl value, $Res Function(_$Step1StateImpl) then) =
      __$$Step1StateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step1StateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1StateImpl>
    implements _$$Step1StateImplCopyWith<$Res> {
  __$$Step1StateImplCopyWithImpl(
      _$Step1StateImpl _value, $Res Function(_$Step1StateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step1StateImpl implements _Step1State {
  const _$Step1StateImpl();

  @override
  String toString() {
    return 'Step1State.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step1StateImpl);
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
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
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
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
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
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
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
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Step1State implements Step1State {
  const factory _Step1State() = _$Step1StateImpl;
}

/// @nodoc
abstract class _$$Step1LoadedStateImplCopyWith<$Res> {
  factory _$$Step1LoadedStateImplCopyWith(_$Step1LoadedStateImpl value,
          $Res Function(_$Step1LoadedStateImpl) then) =
      __$$Step1LoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step1LoadedStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1LoadedStateImpl>
    implements _$$Step1LoadedStateImplCopyWith<$Res> {
  __$$Step1LoadedStateImplCopyWithImpl(_$Step1LoadedStateImpl _value,
      $Res Function(_$Step1LoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step1LoadedStateImpl implements Step1LoadedState {
  const _$Step1LoadedStateImpl();

  @override
  String toString() {
    return 'Step1State.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step1LoadedStateImpl);
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
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
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
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
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
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
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
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Step1LoadedState implements Step1State {
  const factory Step1LoadedState() = _$Step1LoadedStateImpl;
}

/// @nodoc
abstract class _$$Step1ProgressStateImplCopyWith<$Res> {
  factory _$$Step1ProgressStateImplCopyWith(_$Step1ProgressStateImpl value,
          $Res Function(_$Step1ProgressStateImpl) then) =
      __$$Step1ProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step1ProgressStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1ProgressStateImpl>
    implements _$$Step1ProgressStateImplCopyWith<$Res> {
  __$$Step1ProgressStateImplCopyWithImpl(_$Step1ProgressStateImpl _value,
      $Res Function(_$Step1ProgressStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step1ProgressStateImpl implements Step1ProgressState {
  const _$Step1ProgressStateImpl();

  @override
  String toString() {
    return 'Step1State.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step1ProgressStateImpl);
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
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
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
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
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
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
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
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class Step1ProgressState implements Step1State {
  const factory Step1ProgressState() = _$Step1ProgressStateImpl;
}

/// @nodoc
abstract class _$$Step1SuccessStateImplCopyWith<$Res> {
  factory _$$Step1SuccessStateImplCopyWith(_$Step1SuccessStateImpl value,
          $Res Function(_$Step1SuccessStateImpl) then) =
      __$$Step1SuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$Step1SuccessStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1SuccessStateImpl>
    implements _$$Step1SuccessStateImplCopyWith<$Res> {
  __$$Step1SuccessStateImplCopyWithImpl(_$Step1SuccessStateImpl _value,
      $Res Function(_$Step1SuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Step1SuccessStateImpl implements Step1SuccessState {
  const _$Step1SuccessStateImpl();

  @override
  String toString() {
    return 'Step1State.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Step1SuccessStateImpl);
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
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
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
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
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
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
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
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Step1SuccessState implements Step1State {
  const factory Step1SuccessState() = _$Step1SuccessStateImpl;
}

/// @nodoc
abstract class _$$Step1FetchedStateImplCopyWith<$Res> {
  factory _$$Step1FetchedStateImplCopyWith(_$Step1FetchedStateImpl value,
          $Res Function(_$Step1FetchedStateImpl) then) =
      __$$Step1FetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String selectedBooksIds,
      List<Book> books,
      List<Selectable<Book>> booksListing});
}

/// @nodoc
class __$$Step1FetchedStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1FetchedStateImpl>
    implements _$$Step1FetchedStateImplCopyWith<$Res> {
  __$$Step1FetchedStateImplCopyWithImpl(_$Step1FetchedStateImpl _value,
      $Res Function(_$Step1FetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBooksIds = null,
    Object? books = null,
    Object? booksListing = null,
  }) {
    return _then(_$Step1FetchedStateImpl(
      null == selectedBooksIds
          ? _value.selectedBooksIds
          : selectedBooksIds // ignore: cast_nullable_to_non_nullable
              as String,
      null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      null == booksListing
          ? _value._booksListing
          : booksListing // ignore: cast_nullable_to_non_nullable
              as List<Selectable<Book>>,
    ));
  }
}

/// @nodoc

class _$Step1FetchedStateImpl implements Step1FetchedState {
  const _$Step1FetchedStateImpl(this.selectedBooksIds, final List<Book> books,
      final List<Selectable<Book>> booksListing)
      : _books = books,
        _booksListing = booksListing;

  @override
  final String selectedBooksIds;
  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  final List<Selectable<Book>> _booksListing;
  @override
  List<Selectable<Book>> get booksListing {
    if (_booksListing is EqualUnmodifiableListView) return _booksListing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_booksListing);
  }

  @override
  String toString() {
    return 'Step1State.fetched(selectedBooksIds: $selectedBooksIds, books: $books, booksListing: $booksListing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step1FetchedStateImpl &&
            (identical(other.selectedBooksIds, selectedBooksIds) ||
                other.selectedBooksIds == selectedBooksIds) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality()
                .equals(other._booksListing, _booksListing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedBooksIds,
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_booksListing));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Step1FetchedStateImplCopyWith<_$Step1FetchedStateImpl> get copyWith =>
      __$$Step1FetchedStateImplCopyWithImpl<_$Step1FetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
    required TResult Function(String feedback) failure,
  }) {
    return fetched(selectedBooksIds, books, booksListing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return fetched?.call(selectedBooksIds, books, booksListing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(selectedBooksIds, books, booksListing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class Step1FetchedState implements Step1State {
  const factory Step1FetchedState(
      final String selectedBooksIds,
      final List<Book> books,
      final List<Selectable<Book>> booksListing) = _$Step1FetchedStateImpl;

  String get selectedBooksIds;
  List<Book> get books;
  List<Selectable<Book>> get booksListing;
  @JsonKey(ignore: true)
  _$$Step1FetchedStateImplCopyWith<_$Step1FetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Step1SavedStateImplCopyWith<$Res> {
  factory _$$Step1SavedStateImplCopyWith(_$Step1SavedStateImpl value,
          $Res Function(_$Step1SavedStateImpl) then) =
      __$$Step1SavedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedBooks});
}

/// @nodoc
class __$$Step1SavedStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1SavedStateImpl>
    implements _$$Step1SavedStateImplCopyWith<$Res> {
  __$$Step1SavedStateImplCopyWithImpl(
      _$Step1SavedStateImpl _value, $Res Function(_$Step1SavedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBooks = null,
  }) {
    return _then(_$Step1SavedStateImpl(
      null == selectedBooks
          ? _value.selectedBooks
          : selectedBooks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Step1SavedStateImpl implements Step1SavedState {
  const _$Step1SavedStateImpl(this.selectedBooks);

  @override
  final String selectedBooks;

  @override
  String toString() {
    return 'Step1State.saved(selectedBooks: $selectedBooks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step1SavedStateImpl &&
            (identical(other.selectedBooks, selectedBooks) ||
                other.selectedBooks == selectedBooks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedBooks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Step1SavedStateImplCopyWith<_$Step1SavedStateImpl> get copyWith =>
      __$$Step1SavedStateImplCopyWithImpl<_$Step1SavedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
    required TResult Function(String feedback) failure,
  }) {
    return saved(selectedBooks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
    TResult? Function(String feedback)? failure,
  }) {
    return saved?.call(selectedBooks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(selectedBooks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Step1SavedState implements Step1State {
  const factory Step1SavedState(final String selectedBooks) =
      _$Step1SavedStateImpl;

  String get selectedBooks;
  @JsonKey(ignore: true)
  _$$Step1SavedStateImplCopyWith<_$Step1SavedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Step1FailureStateImplCopyWith<$Res> {
  factory _$$Step1FailureStateImplCopyWith(_$Step1FailureStateImpl value,
          $Res Function(_$Step1FailureStateImpl) then) =
      __$$Step1FailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$Step1FailureStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$Step1FailureStateImpl>
    implements _$$Step1FailureStateImplCopyWith<$Res> {
  __$$Step1FailureStateImplCopyWithImpl(_$Step1FailureStateImpl _value,
      $Res Function(_$Step1FailureStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$Step1FailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Step1FailureStateImpl implements Step1FailureState {
  const _$Step1FailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'Step1State.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Step1FailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Step1FailureStateImplCopyWith<_$Step1FailureStateImpl> get copyWith =>
      __$$Step1FailureStateImplCopyWithImpl<_$Step1FailureStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)
        fetched,
    required TResult Function(String selectedBooks) saved,
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
    TResult? Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult? Function(String selectedBooks)? saved,
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
    TResult Function(String selectedBooksIds, List<Book> books,
            List<Selectable<Book>> booksListing)?
        fetched,
    TResult Function(String selectedBooks)? saved,
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
    required TResult Function(_Step1State value) initial,
    required TResult Function(Step1LoadedState value) loaded,
    required TResult Function(Step1ProgressState value) progress,
    required TResult Function(Step1SuccessState value) success,
    required TResult Function(Step1FetchedState value) fetched,
    required TResult Function(Step1SavedState value) saved,
    required TResult Function(Step1FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(Step1LoadedState value)? loaded,
    TResult? Function(Step1ProgressState value)? progress,
    TResult? Function(Step1SuccessState value)? success,
    TResult? Function(Step1FetchedState value)? fetched,
    TResult? Function(Step1SavedState value)? saved,
    TResult? Function(Step1FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(Step1LoadedState value)? loaded,
    TResult Function(Step1ProgressState value)? progress,
    TResult Function(Step1SuccessState value)? success,
    TResult Function(Step1FetchedState value)? fetched,
    TResult Function(Step1SavedState value)? saved,
    TResult Function(Step1FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Step1FailureState implements Step1State {
  const factory Step1FailureState(final String feedback) =
      _$Step1FailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$Step1FailureStateImplCopyWith<_$Step1FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
