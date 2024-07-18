import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'add_loisir_page.dart';

void main() {
  runApp(LoisirsApp());
}

class LoisirsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loisirs App',
      theme: ThemeData(
        primaryColor: Color(0xFF2F70AF),
        scaffoldBackgroundColor: Color(0xFF2F70AF),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF2F70AF),
        ),
        textTheme: TextTheme(
          headlineMedium:
              TextStyle(fontFamily: 'FiraSans', color: Colors.white),
          bodyLarge: TextStyle(fontFamily: 'Numans', color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUpPage(),
        '/add': (context) => AddLoisirPage(),
      },
    );
  }
}
