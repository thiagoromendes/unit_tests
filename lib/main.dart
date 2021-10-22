import 'package:flutter/material.dart';
import 'package:unit_tests/src/pages/dashboard_page.dart';
import 'package:unit_tests/src/pages/login_page.dart';
import 'package:unit_tests/src/pages/register_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const DashboardPage()
      },
    );
  }
}
