class ValidateForm {
  static dynamic validFormLoginEmail(String value) {
    RegExp emailRegx = RegExp('^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?');

    if (value.isEmpty) return 'Informe seu e-mail';

    if (!emailRegx.hasMatch(value)) return 'Informe um e-mail válido';
  }

  static dynamic validFormLoginPassword(String value) {
    if (value.isEmpty) return 'Informe sua senha';

    if (value.length < 6) return 'A senha deve conter no mínimo seis digitos';
  }

  static dynamic validFormLoginName(String value) {
    if (value.isEmpty) return 'Informe seu nome';
  }
}
