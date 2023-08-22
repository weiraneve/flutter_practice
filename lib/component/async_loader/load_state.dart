sealed class LoadState<T> {}

class Idle<T> extends LoadState<T> {}

class Loading<T> extends LoadState<T> {
  final T? data;

  Loading(this.data);
}

class Success<T> extends LoadState<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends LoadState<T> {
  final T? data;
  final Object error;

  Failure(this.data, this.error);
}
