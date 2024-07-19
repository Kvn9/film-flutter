// import 'package:flutter/material.dart';
// import 'drawer.dart';

// class DetailPage extends StatelessWidget {
//   final Map<String, String> film;

//   DetailPage({required this.film});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(film['title']!),
//       ),
//       drawer: AppDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               film['image']!,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: 200,
//             ),
//             SizedBox(height: 10),
//             Text(
//               film['title']!,
//               style: Theme.of(context).textTheme.headlineLarge,
//             ),
//             SizedBox(height: 10),
//             Text(
//               film['description']!,
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Avis: ${film['review']}',
//               style: TextStyle(color: Colors.yellowAccent, fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Date: ${film['date']}',
//               style: TextStyle(color: Colors.yellowAccent, fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'models/loisir.dart';

class DetailPage extends StatelessWidget {
  final Loisir film;

  DetailPage({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              film.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              film.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              film.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Avis: ${film.review}',
              style: TextStyle(color: Colors.yellowAccent, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Date: ${film.date}',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
