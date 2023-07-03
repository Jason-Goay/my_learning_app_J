class RegexHelper {
  static RegExp emailRegex = RegExp(r'\w+@\w+\.\w+');
  static RegExp wordsOnlyRegex = RegExp(r'\w+');
  static RegExp digitsOnlyRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
}
