abstract class BaseApiState {}

class SuccessApiStaet<T> extends BaseApiState {
  T data;
  SuccessApiStaet(this.data);
}

class IdleApiStaet extends BaseApiState {}

class LoadingApiStaet extends BaseApiState {}

class ErrorApiStaet extends BaseApiState {
  String errMessage;
  ErrorApiStaet(this.errMessage);
}
