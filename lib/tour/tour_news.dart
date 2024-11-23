// lib/tour.dart

class Tour {
  final String imageUrl; // URL for the tour image
  final String title;    // Title of the tour
  final String date;     // Date of the tour
  final String price;    // Price of the tour
  final String days;     // Duration of the tour in days

  // Constructor for the Tour class
  Tour({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.price,
    required this.days,
  });

  // Factory constructor to create a Tour object from JSON
  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      imageUrl: json['imageUrl'], // Extracting imageUrl from JSON
      title: json['title'],        // Extracting title from JSON
      date: json['date'],          // Extracting date from JSON
      price: json['price'],        // Extracting price from JSON
      days: json['days'],          // Extracting days from JSON
    );
  }
}
