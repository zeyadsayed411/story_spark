sealed class ResultFB<T> {}

class SucessFB<T> extends ResultFB<T> {
  SucessFB({this.data});
  T? data;
}

class ErrorFB<T> extends ResultFB<T> {
  ErrorFB(this.errorMessage);
  String errorMessage;
}
