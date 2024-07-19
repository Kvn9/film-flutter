class Loisir {
  final int id;
  final String title;
  final String description;
  final String review;
  final String date;
  final String image;
  final String category;

  Loisir({
    required this.id,
    required this.title,
    required this.description,
    required this.review,
    required this.date,
    required this.image,
    required this.category,
  });

  factory Loisir.fromJson(Map<String, dynamic> json) {
    return Loisir(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      review: json['review'],
      date: json['date'],
      image: json['image'] ?? 'images/default.jpg',
      category: json['category'],
    );
  }
}
