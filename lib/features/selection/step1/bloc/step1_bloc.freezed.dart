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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
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
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedStateImpl implements LoadedState {
  const _$LoadedStateImpl();

  @override
  String toString() {
    return 'Step1State.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedStateImpl);
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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements Step1State {
  const factory LoadedState() = _$LoadedStateImpl;
}

/// @nodoc
abstract class _$$ProgressStateImplCopyWith<$Res> {
  factory _$$ProgressStateImplCopyWith(
          _$ProgressStateImpl value, $Res Function(_$ProgressStateImpl) then) =
      __$$ProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProgressStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$ProgressStateImpl>
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
    return 'Step1State.progress()';
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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ProgressState implements Step1State {
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
    extends _$Step1StateCopyWithImpl<$Res, _$SuccessStateImpl>
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
    return 'Step1State.success()';
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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements Step1State {
  const factory SuccessState() = _$SuccessStateImpl;
}

/// @nodoc
abstract class _$$FetchedStateImplCopyWith<$Res> {
  factory _$$FetchedStateImplCopyWith(
          _$FetchedStateImpl value, $Res Function(_$FetchedStateImpl) then) =
      __$$FetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String selectedBooksIds,
      List<Book> books,
      List<Selectable<Book>> booksListing});
}

/// @nodoc
class __$$FetchedStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$FetchedStateImpl>
    implements _$$FetchedStateImplCopyWith<$Res> {
  __$$FetchedStateImplCopyWithImpl(
      _$FetchedStateImpl _value, $Res Function(_$FetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBooksIds = null,
    Object? books = null,
    Object? booksListing = null,
  }) {
    return _then(_$FetchedStateImpl(
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

class _$FetchedStateImpl implements FetchedState {
  const _$FetchedStateImpl(this.selectedBooksIds, final List<Book> books,
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
            other is _$FetchedStateImpl &&
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
  _$$FetchedStateImplCopyWith<_$FetchedStateImpl> get copyWith =>
      __$$FetchedStateImplCopyWithImpl<_$FetchedStateImpl>(this, _$identity);

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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class FetchedState implements Step1State {
  const factory FetchedState(
      final String selectedBooksIds,
      final List<Book> books,
      final List<Selectable<Book>> booksListing) = _$FetchedStateImpl;

  String get selectedBooksIds;
  List<Book> get books;
  List<Selectable<Book>> get booksListing;
  @JsonKey(ignore: true)
  _$$FetchedStateImplCopyWith<_$FetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SavedStateImplCopyWith<$Res> {
  factory _$$SavedStateImplCopyWith(
          _$SavedStateImpl value, $Res Function(_$SavedStateImpl) then) =
      __$$SavedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedBooks});
}

/// @nodoc
class __$$SavedStateImplCopyWithImpl<$Res>
    extends _$Step1StateCopyWithImpl<$Res, _$SavedStateImpl>
    implements _$$SavedStateImplCopyWith<$Res> {
  __$$SavedStateImplCopyWithImpl(
      _$SavedStateImpl _value, $Res Function(_$SavedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedBooks = null,
  }) {
    return _then(_$SavedStateImpl(
      null == selectedBooks
          ? _value.selectedBooks
          : selectedBooks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SavedStateImpl implements SavedState {
  const _$SavedStateImpl(this.selectedBooks);

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
            other is _$SavedStateImpl &&
            (identical(other.selectedBooks, selectedBooks) ||
                other.selectedBooks == selectedBooks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedBooks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedStateImplCopyWith<_$SavedStateImpl> get copyWith =>
      __$$SavedStateImplCopyWithImpl<_$SavedStateImpl>(this, _$identity);

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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class SavedState implements Step1State {
  const factory SavedState(final String selectedBooks) = _$SavedStateImpl;

  String get selectedBooks;
  @JsonKey(ignore: true)
  _$$SavedStateImplCopyWith<_$SavedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$Step1StateCopyWithImpl<$Res, _$FailureStateImpl>
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
    return 'Step1State.failure(feedback: $feedback)';
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
    required TResult Function(LoadedState value) loaded,
    required TResult Function(ProgressState value) progress,
    required TResult Function(SuccessState value) success,
    required TResult Function(FetchedState value) fetched,
    required TResult Function(SavedState value) saved,
    required TResult Function(FailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Step1State value)? initial,
    TResult? Function(LoadedState value)? loaded,
    TResult? Function(ProgressState value)? progress,
    TResult? Function(SuccessState value)? success,
    TResult? Function(FetchedState value)? fetched,
    TResult? Function(SavedState value)? saved,
    TResult? Function(FailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Step1State value)? initial,
    TResult Function(LoadedState value)? loaded,
    TResult Function(ProgressState value)? progress,
    TResult Function(SuccessState value)? success,
    TResult Function(FetchedState value)? fetched,
    TResult Function(SavedState value)? saved,
    TResult Function(FailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureState implements Step1State {
  const factory FailureState(final String feedback) = _$FailureStateImpl;

  String get feedback;
  @JsonKey(ignore: true)
  _$$FailureStateImplCopyWith<_$FailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
