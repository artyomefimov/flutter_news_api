class ResultWrapper<T> {
  ResultWrapper._();

  factory ResultWrapper.success(T result) = Success;
  factory ResultWrapper.error(String errorMessage) = Error;
}

class Success<T> extends ResultWrapper<T> {
  Success(this.result): super._();

  late final T result;
}

class Error<T> extends ResultWrapper<T> {
  Error(this.errorMessage): super._();

  late final String errorMessage;
}
