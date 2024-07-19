import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/loisir.dart';

class LoisirService {
  static const String apiUrl = 'http://localhost:8000/loisirs';

  Future<List<Loisir>> fetchLoisirs() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Loisir.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load loisirs');
    }
  }
}
