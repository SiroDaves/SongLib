part of 'settings_bloc.dart';

enum Status {
  // Generic statuses
  /// No action has been taken so far.
  initial,

  /// An action is being processed.
  inProgress,

  /// A process has been completed successfully.
  success,

  /// A process has failed.
  failure,

  /// A process has been canceled.
  canceled,

  /// Data loaded successfully.
  loaded,
}

final class SettingsState extends Equatable {
  const SettingsState({
    this.status = Status.initial,
    this.feedback = '',
    this.hasReachedMax = false,
  });

  final Status status;
  final String feedback;
  final bool hasReachedMax;

  SettingsState copyWith({
    Status? status,
    String? feedback,
    bool? hasReachedMax,
  }) {
    return SettingsState(
      status: status ?? this.status,
      feedback: feedback ?? this.feedback,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props =>
      [status, feedback, hasReachedMax];
}
