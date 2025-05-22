extension BoolExtensions on bool {
  String get formatBoolToString {
    if (this == true) {
      return 'نعم';
    }
    return 'لا';
  }
}
