import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tests/src/classes/validate_form.dart';

void main() {
  test('Test valitation field email with value empty', () {
    expect(ValidateForm.validFormLoginEmail(''), 'Informe seu e-mail');
  });

  test('Test valitation field email with value invalid', () {
    expect(
        ValidateForm.validFormLoginEmail('teste'), 'Informe um e-mail válido');
  });

  test('Test valitation field email with value valid', () {
    expect(ValidateForm.validFormLoginEmail('teste@gmail.com'), null);
  });

  test('Test valitation field password with value empty', () {
    expect(ValidateForm.validFormLoginPassword(''), 'Informe sua senha');
  });

  test('Test valitation field password with value invalid', () {
    expect(ValidateForm.validFormLoginPassword('1234'),
        'A senha deve conter no mínimo seis digitos');
  });

  test('Test valitation field password with value valid', () {
    expect(ValidateForm.validFormLoginPassword('123456'), null);
  });

  test('Test valitation field name with value empty', () {
    expect(ValidateForm.validFormLoginName(''), 'Informe seu nome');
  });

  test('Test valitation field name with value filled', () {
    expect(ValidateForm.validFormLoginName('Jhon Doe'), null);
  });
}
