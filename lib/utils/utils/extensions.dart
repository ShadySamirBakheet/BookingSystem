extension CheckDataForm on String {
  bool isValidTest(int maxChar) {
    return !(isNotEmpty && length >= maxChar) ? true : false;
  }
}
