import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(LoisirsApp());
}

class LoisirsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        // Ajoutez d'autres routes ici si nécessaire
      },
    );
  }
}
