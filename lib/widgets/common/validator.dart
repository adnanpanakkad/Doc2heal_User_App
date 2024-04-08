class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
  textFeildValidation(String value) {
    if (value.isEmpty) {
      return "Fill the field";
    } else {
      return null;
    }
  }
}