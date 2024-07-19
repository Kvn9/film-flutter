import 'package:film_flutter/social_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'add_loisir_page.dart';
import 'welcome_page.dart';
import 'delayed_animation.dart';

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
        primaryColor: Color(0xFFB9848C),
        scaffoldBackgroundColor: Color(0xFFEEEAE4),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFEEEAE4),
        ),
        textTheme: TextTheme(
          headlineMedium:
              TextStyle(fontFamily: 'FiraSans', color: Colors.black),
          bodyLarge: TextStyle(fontFamily: 'Numans', color: Colors.black),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUpPage(),
        '/add': (context) => AddLoisirPage(),
      },
    );
  }
}
