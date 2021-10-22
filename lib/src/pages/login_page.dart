import 'package:flutter/material.dart';
import 'package:unit_tests/src/classes/validate_form.dart';
import 'package:unit_tests/src/components/custom_primary_button.dart';
import 'package:unit_tests/src/components/custom_second_button.dart';
import 'package:unit_tests/src/components/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 60, left: 40, right: 40),
      color: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: 128,
            width: 128,
            child: Image.asset('assets/image/mas-login.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                      key: Key('TextFormLoginEmailKey'),
                      label: 'E-mail',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validate: ValidateForm.validFormLoginEmail),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      key: Key('TextFormLoginPasswordKey'),
                      label: 'Senha',
                      controller: passwordController,
                      obscureText: true,
                      validate: ValidateForm.validFormLoginPassword),
                  SizedBox(
                    height: 40,
                  ),
                  CustomPromaryButton(
                    label: 'Entrar',
                    icon: Icons.login,
                    onPressed: sendData,
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          CustomSecondButton(
            label: 'Cadastre-se',
            onPressed: () => Navigator.pushNamed(context, '/register'),
          )
        ],
      ),
    ));
  }

  void sendData() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/dashboard', (route) => false);
    }
  }
}
