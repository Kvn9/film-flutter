import 'package:film_flutter/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'delayed_animation.dart';
import 'login_page.dart';



class SocialPage extends StatelessWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
              delay: 1000,
              child: SizedBox(
                height: 500,
                child: Image.asset('images/social1.png'),
              ),
            ),
            DelayedAnimation(
              delay: 2000,
              child: SizedBox(
                height: 100,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 30,
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "On s'occupe de tout",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Les meilleurs activités près de chez vous",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 2500,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(), backgroundColor: Color(0xFFB9848C),
                          padding: const EdgeInsets.all(13)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'CONNEXION',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.arrow_right_rounded,
                          color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(), backgroundColor: const Color.fromARGB(255, 63, 125, 187),
                          padding: const EdgeInsets.all(13)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "INSCRIPTION",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}