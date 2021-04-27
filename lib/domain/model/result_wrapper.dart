class ResultWrapper<T> {
  ResultWrapper._();

  factory ResultWrapper.success(T result) = Success;

  factory ResultWrapper.error(String errorMessage) = Error;

  void collect({
    required void Function(T) onSuccess,
    required void Function(String) onError,
  }) {
    if (this is Success) {
      onSuccess.call((this as Success).result);
    } else {
      onError.call((this as Error).errorMessage);
    }
  }
}

class Success<T> extends ResultWrapper<T> {
  Success(this.result) : super._();

  late final T result;
}

class Error<T> extends ResultWrapper<T> {
  Error(this.errorMessage) : super._();

  late final String errorMessage;
}
