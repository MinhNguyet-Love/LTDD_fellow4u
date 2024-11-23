// travel_news_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'favourite_news.dart'; // Ensure this is the correct import

class TravelNewsService {
  final String apiUrl = 'https://server-api-opqn.onrender.com/thongbao/api';

  Future<List<TravelNews1>> fetchTravelNews() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => TravelNews1.fromJson(news)).toList(); // Return TravelNews1
    } else {
      throw Exception('Failed to load favourite news');
    }
  }
}
