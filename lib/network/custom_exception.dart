class CustomException {
  final String message;

  CustomException(this.message);

  @override
  String toString() => message;
}