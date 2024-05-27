class Validators {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static String? validateQuantity(String value) {
    if (value.isEmpty || int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Enter a valid quantity';
    }
    return null;
  }
}
