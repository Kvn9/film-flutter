import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> films = [
    {
      'title': 'Batman',
      'image': 'images/batman.jpg',
      'description': "Le Batman, est un film américain d'action...",
      'review': '4.5/5'
    },
    {
      'title': 'Petit Prince',
      'image': 'images/petit_prince.jpg',
      'description': 'Le Petit Prince est une œuvre de langue française...',
      'review': '4.0/5'
    },
    {
      'title': 'Inception',
      'image': 'images/inception.jpg',
      'description':
          "Dom Cobb est un voleur expérimenté dans l'art périlleux de l'extraction...",
      'review': '3.5/5'
    },
    {
      'title': 'Spider Man',
      'image': 'images/spider-man.jpg',
      'description':
          'Spider-Man est une série de films américains de super-héros...',
      'review': '4.2/5'
    },
    {
      'title': 'Avengers',
      'image': 'images/avengers.jpg',
      'description': "Quand un ennemi inattendu fait surface pour menacer...",
      'review': '3.8/5'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loisirs'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Films', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: films.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(film: films[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            films[index]['image']!,
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  films[index]['title']!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  films[index]['description']!,
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Avis: ${films[index]['review']}',
                                  style: TextStyle(color: Colors.yellowAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
