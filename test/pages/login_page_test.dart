import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_tests/src/pages/dashboard_page.dart';
import 'package:unit_tests/src/pages/login_page.dart';
import 'package:unit_tests/src/pages/register_page.dart';

void main() {
  testWidgets('Login page initial state', (tester) async {
    //Renderiza o widget
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));

    await tester.pump();

    //Achou o campo E-mail do formulário
    expect(find.text('E-mail'), findsOneWidget);

    //Achou o campo Senha do formulário
    expect(find.text('Senha'), findsOneWidget);

    //Achou o botão Entrar do formulário
    expect(find.text('Entrar'), findsOneWidget);
  });

  testWidgets('Login page action form enter sucess', (tester) async {
    //Renderiza o widget
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
      routes: {'/dashboard': (context) => const DashboardPage()},
    ));

    await tester.pump();

    //Achou o campo E-mail do formulário
    final emailValue = find.byKey(Key('TextFormLoginEmailKey'));

    //Insere o valor teste@gmail.com no campo E-mail
    await tester.enterText(emailValue, 'teste@gmail.com');

    //Achou o campo Senha do formulário
    final passwordValue = find.byKey(Key('TextFormLoginPasswordKey'));

    //Insere o valor 123456 no campo Senha
    await tester.enterText(passwordValue, '123456');

    //Achou o botão Entrar do formulário
    final enterButton = find.text('Entrar');

    //Fez a ação do tap no botão
    await tester.tap(enterButton);

    await tester.pumpAndSettle();

    //Fez o roteamento para a página Dashboard
    expect(find.byKey(Key('DahsboardPageKey')), findsOneWidget);
  });

  testWidgets('Login page action form enter failed validation in email field',
      (tester) async {
    //Renderiza o widget
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
      routes: {'/dashboard': (context) => const DashboardPage()},
    ));

    await tester.pump();

    //Achou o campo E-mail do formulário
    final emailValue = find.byKey(Key('TextFormLoginEmailKey'));

    //Insere o valor inválido teste no campo E-mail
    await tester.enterText(emailValue, 'teste');

    //Achou o campo Senha do formulário
    final passwordValue = find.byKey(Key('TextFormLoginPasswordKey'));

    //Insere o valor 123456 no campo Senha
    await tester.enterText(passwordValue, '123456');

    //Achou o botão Entrar do formulário
    final enterButton = find.text('Entrar');

    //Fez a ação do tap no botão
    await tester.tap(enterButton);

    await tester.pumpAndSettle();

    //Não houve o roteamento por falha na validação do campo E-mail
    expect(find.byKey(Key('DahsboardPageKey')), findsNothing);
  });

  testWidgets(
      'Login page action form enter failed validation in password field',
      (tester) async {
    //Renderiza o widget
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
      routes: {'/dashboard': (context) => const DashboardPage()},
    ));

    await tester.pump();

    //Achou o campo E-mail do formulário
    final emailValue = find.byKey(Key('TextFormLoginEmailKey'));

    //Insere o valor teste@gmail.com no campo E-mail
    await tester.enterText(emailValue, 'teste@gmail.com');

    //Achou o campo Senha do formulário
    final passwordValue = find.byKey(Key('TextFormLoginPasswordKey'));

    //Insere o valor inválido 1234 no campo Senha
    await tester.enterText(passwordValue, '1234');

    //Achou o botão Entrar do formulário
    final enterButton = find.text('Entrar');

    //Fez a ação do tap no botão
    await tester.tap(enterButton);

    await tester.pumpAndSettle();

    //Não houve o roteamento por falha na validação do campo Senha
    expect(find.byKey(Key('DahsboardPageKey')), findsNothing);
  });

  testWidgets('Login page action form register', (tester) async {
    //Renderiza o widget
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
      routes: {'/register': (context) => const RegisterPage()},
    ));

    await tester.pump();

    //Achou o botão Cadastra-se
    final registerButton = find.text('Cadastre-se');

    //Fez a ação do tap no botão
    await tester.tap(registerButton);

    await tester.pumpAndSettle();

    //Fez o roteamento para a página Register
    expect(find.byKey(Key('RegisterPageKey')), findsOneWidget);
  });
}
