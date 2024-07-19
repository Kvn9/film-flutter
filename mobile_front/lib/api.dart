import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'http://localhost:8000/loisir'; // Assurez-vous que l'URL est correcte

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse('$baseUrl/films'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((film) => Film.fromJson(film)).toList();
    } else {
      throw Exception('Failed to load films');
    }
  }

  Future<void> addFilm(Film film) async {
    final response = await http.post(
      Uri.parse('$baseUrl/films'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(film.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create film');
    }
  }
}

class Film {
  final int? id;
  final String title;
  final String description;
  final String review;
  final String date;
  final String image;

  Film(
      {this.id,
      required this.title,
      required this.description,
      required this.review,
      required this.date,
      required this.image});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      review: json['review'],
      date: json['date'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'review': review,
      'date': date,
      'image': image,
    };
  }
}
