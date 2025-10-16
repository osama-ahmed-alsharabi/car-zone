abstract class BackendResult<T, E> {}

class Success<T, E> extends BackendResult<T, E> {
  final T value;
  Success(this.value);
}

class Failure<T, E> extends BackendResult<T, E> {
  final E error;
  Failure(this.error);
}