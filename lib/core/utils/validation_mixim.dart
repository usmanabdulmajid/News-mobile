mixin ValidationMixin {
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter email';
    }
    if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter password';
    }
    final hasDigits = password.contains(RegExp('[0-9]'));
    final hasCharacter = password.contains(RegExp(r'\W'));
    final hasUpperAndLowerCase =
        password.contains(RegExp(r'\d')) && password.contains(RegExp(r'[a-z]'));
    if (!hasDigits) {
      return 'Password must contain at least one number';
    }
    if (!hasUpperAndLowerCase) {
      return 'Password must contain at upper and lower case letters';
    }
    if (!hasCharacter) {
      return 'Password must contain at least one character';
    }
    if (password.length < 8) {
      return 'Password cannot be less than 8 characters';
    }

    return null;
  }

  String? validateName(String? firstname) {
    if (firstname!.isEmpty) {
      return 'Name cannot be empty';
    }
    if (firstname.length < 3) {
      return 'Please enter a valid name';
    }
    return null;
  }
}
