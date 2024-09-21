String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Informe o nome';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Informe o email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Informe a senha';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value != password) {
    return 'Senha invalida';
  }
  return null;
}