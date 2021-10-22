import 'package:flutter/material.dart';
import 'package:unit_tests/src/classes/validate_form.dart';
import 'package:unit_tests/src/components/custom_primary_button.dart';
import 'package:unit_tests/src/components/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('RegisterPageKey'),
        appBar: AppBar(),
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
                          key: Key('TextFormNameKey'),
                          label: 'Nome',
                          controller: nameController,
                          validate: ValidateForm.validFormLoginName),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          key: Key('TextFormEmailKey'),
                          label: 'E-mail',
                          controller: emailController,
                          validate: ValidateForm.validFormLoginEmail),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          key: Key('TextFormPasswordKey'),
                          label: 'Senha',
                          controller: passwordController,
                          validate: ValidateForm.validFormLoginPassword),
                      SizedBox(
                        height: 40,
                      ),
                      CustomPromaryButton(
                        label: 'Cadastrar',
                        icon: Icons.app_registration,
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        onPressed: sendData,
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }

  void sendData() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }
}
