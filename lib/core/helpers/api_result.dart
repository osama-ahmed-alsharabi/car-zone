abstract class ApiResult<T, E> {}

class Success<T, E> extends ApiResult<T, E> {
  final T value;
  Success(this.value);
}

class Failure<T, E> extends ApiResult<T, E> {
  final E error;
  Failure(this.error);
}