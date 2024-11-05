
class TravelNews {
  final String imageUrl;
  final String title;
  final String date;

  TravelNews({required this.imageUrl, required this.title, required this.date});

  factory TravelNews.fromJson(Map<String, dynamic> json) {
    return TravelNews(
      imageUrl: json['imageUrl'],
      title: json['title'],
      date: json['date'],
    );
  }
}
