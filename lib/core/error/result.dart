import 'failuors.dart';

/// A generic sealed-style Result type for Clean Architecture.
///
/// Encapsulates either a [Failure] or a successful value of type [T].
abstract class Result<T> {
  const Result();

  factory Result.success(T data) = Success<T>;
  factory Result.failure(Failure failure) = FailureResult<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get dataOrNull => isSuccess ? (this as Success<T>).data : null;
  Failure? get failureOrNull =>
      isFailure ? (this as FailureResult<T>).failure : null;

  R fold<R>(
    R Function(Failure failure) onFailure,
    R Function(T data) onSuccess,
  ) {
    if (this is Success<T>) {
      return onSuccess((this as Success<T>).data);
    } else if (this is FailureResult<T>) {
      return onFailure((this as FailureResult<T>).failure);
    }
    throw StateError('Unknown Result subclass: $runtimeType');
  }

  void when({
    required void Function(T data) onSuccess,
    required void Function(Failure failure) onFailure,
  }) {
    if (this is Success<T>) {
      onSuccess((this as Success<T>).data);
    } else if (this is FailureResult<T>) {
      onFailure((this as FailureResult<T>).failure);
    }
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Result.success($data)';
}

class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureResult<T> &&
          runtimeType == other.runtimeType &&
          failure == other.failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'Result.failure($failure)';
}
