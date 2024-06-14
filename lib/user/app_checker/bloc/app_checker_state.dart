part of 'app_checker_bloc.dart';

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

  // status specific with this bloc
  /// App update found.
  updateFound,

  /// App has been updated.
  updated,
}

final class AppCheckerState extends Equatable {
  const AppCheckerState({
    this.status = Status.initial,
    this.feedback = '',
  });

  final Status status;
  final String feedback;

  AppCheckerState copyWith({
    Status? status,
    String? feedback,
  }) {
    return AppCheckerState(
      status: status ?? this.status,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  List<Object> get props => [status, feedback];
}
