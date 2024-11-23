class TravelNews1 {
  final String imageUrl;
  final String title;
  final String date;

  TravelNews1({required this.imageUrl, required this.title, required this.date});

  factory TravelNews1.fromJson(Map<String, dynamic> json) {
    return TravelNews1(
      imageUrl: json['imageUrl'] ?? '', // Default to an empty string if null
      title: json['title'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
