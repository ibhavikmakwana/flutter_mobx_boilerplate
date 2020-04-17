extension StringX on String {
  bool get isValidEmail =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);

  bool get isValidPassword => this.length > 6;
}
