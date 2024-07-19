// import 'package:flutter/material.dart';
// import 'detail_page.dart';
// import 'drawer.dart';
// import 'add_loisir_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Map<String, String>> films = [
//     {
//       'title': 'Batman',
//       'image': 'images/batman.jpg',
//       'description': "Le Batman, est un film américain d'action...",
//       'review': '4.5/5',
//       'date': '2022'
//     },
//     {
//       'title': 'Petit Prince',
//       'image': 'images/petit_prince.jpg',
//       'description': 'Le Petit Prince est une œuvre française...',
//       'review': '4.0/5',
//       'date': '1943'
//     },
//     {
//       'title': 'Inception',
//       'image': 'images/inception.jpg',
//       'description': "Dom Cobb est un voleur expérimenté dans l'art...",
//       'review': '3.5/5',
//       'date': '2010',
//     },
//     {
//       'title': 'Spider Man',
//       'image': 'images/spider-man.jpg',
//       'description': 'Spider-Man est une série de films...',
//       'review': '4.2/5',
//       'date': '2012 ',
//     },
//     {
//       'title': 'Avengers',
//       'image': 'images/avengers.jpg',
//       'description': "Quand un ennemi inattendu...",
//       'review': '3.8/5',
//       'date': '2022',
//     },
//   ];

//   List<Map<String, String>> filteredFilms = [];
//   String _searchQuery = '';
//   bool _isSortedByAlphabet = false;
//   bool _isSortedByDate = false;

//   @override
//   void initState() {
//     super.initState();
//     filteredFilms = films;
//   }

//   void _filterFilms(String query) {
//     setState(() {
//       _searchQuery = query.toLowerCase();
//       filteredFilms = films.where((film) {
//         return film['title']!.toLowerCase().contains(_searchQuery);
//       }).toList();
//     });
//   }

//   void _toggleSortAlphabetically() {
//     setState(() {
//       if (_isSortedByAlphabet) {
//         filteredFilms = films.where((film) {
//           return film['title']!.toLowerCase().contains(_searchQuery);
//         }).toList();
//       } else {
//         filteredFilms.sort((a, b) => a['title']!.compareTo(b['title']!));
//       }
//       _isSortedByAlphabet = !_isSortedByAlphabet;
//       _isSortedByDate = false;
//     });
//   }

//   void _toggleSortByDate() {
//     setState(() {
//       if (_isSortedByDate) {
//         filteredFilms = films.where((film) {
//           return film['title']!.toLowerCase().contains(_searchQuery);
//         }).toList();
//       } else {
//         filteredFilms.sort((a, b) => a['date']!.compareTo(b['date']!));
//       }
//       _isSortedByDate = !_isSortedByDate;
//       _isSortedByAlphabet = false;
//     });
//   }

//   void _addNewLoisir(Map<String, String> newLoisir) {
//     setState(() {
//       films.add(newLoisir);
//       _filterFilms(_searchQuery);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           decoration: InputDecoration(
//             hintText: 'Rechercher...',
//             hintStyle: TextStyle(color: Colors.black),
//             border: InputBorder.none,
//           ),
//           style: TextStyle(color: Colors.black),
//           onChanged: _filterFilms,
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.sort_by_alpha),
//             onPressed: _toggleSortAlphabetically,
//             color: _isSortedByAlphabet ? Colors.yellow : Colors.black,
//           ),
//           IconButton(
//             icon: Icon(Icons.date_range),
//             onPressed: _toggleSortByDate,
//             color: _isSortedByDate ? Colors.yellow : Colors.black,
//           ),
//         ],
//       ),
//       drawer: AppDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Films', style: Theme.of(context).textTheme.headlineMedium),
//             SizedBox(height: 10),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10.0,
//                   mainAxisSpacing: 10.0,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: filteredFilms.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               DetailPage(film: filteredFilms[index]),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       color: Colors.black12,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             filteredFilms[index]['image']!,
//                             fit: BoxFit.cover,
//                             height: 130,
//                             width: double.infinity,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   filteredFilms[index]['title']!,
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   filteredFilms[index]['description']!,
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   'Avis: ${filteredFilms[index]['review']}',
//                                   style: TextStyle(color: Colors.yellowAccent),
//                                 ),
//                                 SizedBox(height: 1),
//                                 Text(
//                                   'Date: ${filteredFilms[index]['date']}',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final newLoisir = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddLoisirPage(),
//             ),
//           );
//           if (newLoisir != null) {
//             _addNewLoisir(newLoisir);
//           }
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'models/loisir.dart';
// import 'detail_page.dart';
// import 'drawer.dart';
// import 'add_loisir_page.dart'; // Importez la nouvelle page

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Loisir> loisirs = [];
//   List<Loisir> filteredLoisirs = [];
//   String _searchQuery = '';
//   String _ratingQuery = '';
//   bool _isSortedByAlphabet = false;
//   bool _isSortedByDate = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchLoisirs();
//   }

//   Future<void> _fetchLoisirs() async {
//     final response = await http.get(Uri.parse('http://localhost:8000/loisirs'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       print(data); // Imprimez les données pour voir leur structure
//       setState(() {
//         loisirs = data
//             .map((item) => Loisir.fromJson(item as Map<String, dynamic>))
//             .toList();
//         filteredLoisirs = loisirs;
//       });
//     } else {
//       throw Exception('Failed to load loisirs');
//     }
//   }

//   void _filterLoisirs(String query) {
//     setState(() {
//       _searchQuery = query.toLowerCase();
//       _applyFilters();
//     });
//   }

//   void _filterByRating(String query) {
//     setState(() {
//       _ratingQuery = query;
//       _applyFilters();
//     });
//   }

//   void _applyFilters() {
//     filteredLoisirs = loisirs.where((loisir) {
//       final matchesTitle = loisir.title.toLowerCase().contains(_searchQuery);
//       final matchesRating =
//           _ratingQuery.isEmpty || loisir.review.contains(_ratingQuery);
//       return matchesTitle && matchesRating;
//     }).toList();
//   }

//   void _toggleSortAlphabetically() {
//     setState(() {
//       if (_isSortedByAlphabet) {
//         filteredLoisirs = loisirs.where((loisir) {
//           return loisir.title.toLowerCase().contains(_searchQuery);
//         }).toList();
//       } else {
//         filteredLoisirs.sort((a, b) => a.title.compareTo(b.title));
//       }
//       _isSortedByAlphabet = !_isSortedByAlphabet;
//       _isSortedByDate = false;
//     });
//   }

//   void _toggleSortByDate() {
//     setState(() {
//       if (_isSortedByDate) {
//         filteredLoisirs = loisirs.where((loisir) {
//           return loisir.title.toLowerCase().contains(_searchQuery);
//         }).toList();
//       } else {
//         filteredLoisirs.sort((a, b) => a.date.compareTo(b.date));
//       }
//       _isSortedByDate = !_isSortedByDate;
//       _isSortedByAlphabet = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Rechercher...',
//                   hintStyle: TextStyle(color: Colors.black),
//                   border: InputBorder.none,
//                 ),
//                 style: TextStyle(color: Colors.black),
//                 onChanged: _filterLoisirs,
//               ),
//             ),
//             SizedBox(width: 10),
//             Container(
//               width: 100,
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Notation',
//                   hintStyle: TextStyle(color: Colors.black),
//                   border: InputBorder.none,
//                 ),
//                 style: TextStyle(color: Colors.black),
//                 keyboardType: TextInputType.number,
//                 onChanged: _filterByRating,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.sort_by_alpha),
//             onPressed: _toggleSortAlphabetically,
//             color: _isSortedByAlphabet ? Colors.yellow : Colors.black,
//           ),
//           IconButton(
//             icon: Icon(Icons.date_range),
//             onPressed: _toggleSortByDate,
//             color: _isSortedByDate ? Colors.yellow : Colors.black,
//           ),
//         ],
//       ),
//       drawer: AppDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Films', style: Theme.of(context).textTheme.headlineMedium),
//             SizedBox(height: 10),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10.0,
//                   mainAxisSpacing: 10.0,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: filteredLoisirs.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               DetailPage(film: filteredLoisirs[index]),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       color: Colors.black12,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.network(
//                             filteredLoisirs[index].image,
//                             fit: BoxFit.cover,
//                             height: 130,
//                             width: double.infinity,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   filteredLoisirs[index].title,
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   filteredLoisirs[index].description,
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   'Avis: ${filteredLoisirs[index].review}',
//                                   style: TextStyle(color: Colors.yellowAccent),
//                                 ),
//                                 SizedBox(height: 2),
//                                 Text(
//                                   'Date: ${filteredLoisirs[index].date}',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final newLoisir = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddLoisirPage(),
//             ),
//           );
//           if (newLoisir != null) {
//             _addNewLoisir(newLoisir);
//           }
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _addNewLoisir(Loisir newLoisir) {
//     setState(() {
//       loisirs.add(newLoisir);
//       _applyFilters();
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/loisir.dart';
import 'detail_page.dart';
import 'drawer.dart';
import 'add_loisir_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Loisir> loisirs = [];
  List<Loisir> filteredLoisirs = [];
  String _searchQuery = '';
  String _ratingQuery = '';
  bool _isSortedByAlphabet = false;
  bool _isSortedByDate = false;

  @override
  void initState() {
    super.initState();
    _fetchLoisirs();
  }

  Future<void> _fetchLoisirs() async {
    final response = await http.get(Uri.parse('http://localhost:8000/loisirs'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        loisirs = data
            .map((item) => Loisir.fromJson(item as Map<String, dynamic>))
            .toList();
        filteredLoisirs = loisirs;
      });
    } else {
      throw Exception('Failed to load loisirs');
    }
  }

  void _filterLoisirs(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _applyFilters();
    });
  }

  void _filterByRating(String query) {
    setState(() {
      _ratingQuery = query;
      _applyFilters();
    });
  }

  void _applyFilters() {
    filteredLoisirs = loisirs.where((loisir) {
      final matchesTitle = loisir.title.toLowerCase().contains(_searchQuery);
      final matchesRating =
          _ratingQuery.isEmpty || loisir.review.contains(_ratingQuery);
      return matchesTitle && matchesRating;
    }).toList();
  }

  void _toggleSortAlphabetically() {
    setState(() {
      if (_isSortedByAlphabet) {
        filteredLoisirs = loisirs.where((loisir) {
          return loisir.title.toLowerCase().contains(_searchQuery);
        }).toList();
      } else {
        filteredLoisirs.sort((a, b) => a.title.compareTo(b.title));
      }
      _isSortedByAlphabet = !_isSortedByAlphabet;
      _isSortedByDate = false;
    });
  }

  void _toggleSortByDate() {
    setState(() {
      if (_isSortedByDate) {
        filteredLoisirs = loisirs.where((loisir) {
          return loisir.title.toLowerCase().contains(_searchQuery);
        }).toList();
      } else {
        filteredLoisirs.sort((a, b) => a.date.compareTo(b.date));
      }
      _isSortedByDate = !_isSortedByDate;
      _isSortedByAlphabet = false;
    });
  }

  void _addNewLoisir(Loisir newLoisir) {
    setState(() {
      loisirs.add(newLoisir);
      _applyFilters();
    });
  }

  List<Loisir> _getTop5ByCategory(String category) {
    List<Loisir> categoryLoisirs =
        loisirs.where((loisir) => loisir.category == category).toList();
    categoryLoisirs.sort(
        (a, b) => double.parse(b.review).compareTo(double.parse(a.review)));
    return categoryLoisirs.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
                onChanged: _filterLoisirs,
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Notation',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                onChanged: _filterByRating,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: _toggleSortAlphabetically,
            color: _isSortedByAlphabet ? Colors.yellow : Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.date_range),
            onPressed: _toggleSortByDate,
            color: _isSortedByDate ? Colors.yellow : Colors.black,
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top 5 des meilleurs avis par catégories',
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: ['Film', 'Manga', 'Livre', 'Série', 'Comics']
                    .map((category) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category,
                          style: Theme.of(context).textTheme.headlineSmall),
                      SizedBox(height: 5),
                      Container(
                        height: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                _getTop5ByCategory(category).map((loisir) {
                              return Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 10),
                                child: Card(
                                  color: Colors.black12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        loisir.image,
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: double.infinity,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              loisir.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              loisir.review,
                                              style: TextStyle(
                                                  color: Colors.yellowAccent),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            Text('Tous les loisirs',
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredLoisirs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(film: filteredLoisirs[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.black12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            filteredLoisirs[index].image,
                            fit: BoxFit.cover,
                            height: 130,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredLoisirs[index].title,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  filteredLoisirs[index].category,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  filteredLoisirs[index].description,
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Avis: ${filteredLoisirs[index].review}',
                                  style: TextStyle(color: Colors.yellowAccent),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  'Date: ${filteredLoisirs[index].date}',
                                  style: TextStyle(color: Colors.black),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newLoisir = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddLoisirPage(),
            ),
          );
          if (newLoisir != null) {
            _addNewLoisir(newLoisir);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
