import 'package:film_flutter/social_page.dart';
import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 50,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                  delay: 1500,
                  child: Container(
                    height: 250,
                    margin: EdgeInsets.only(left: 20),
                    child: Image.asset('images/freetimelogo.png'),
                  )),
              DelayedAnimation(
                  delay: 2500,
                  child: Container(
                    height: 270,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Image.asset('images/welcome.png'),
                  )),
              DelayedAnimation(
                  delay: 3500,
                  child: Container(
                      height: 80,
                      child: Text('Découvrez, Explorez, Vivez',
                          style: GoogleFonts.numans(
                              color: Colors.grey, fontSize: 16)))),
              DelayedAnimation(
                  delay: 4500,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFB9848C),
                      ),
                      child: Text(
                        "C'est parti",
                        style: GoogleFonts.firaSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SocialPage(),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
