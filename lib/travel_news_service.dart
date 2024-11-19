import 'dart:convert';
import 'package:http/http.dart' as http;
import 'travel_news.dart';

class TravelNewsService {
  final String apiUrl = 'https://server-api-opqn.onrender.com/travel-news/api';

  // Fetch travel news from API
  Future<List<TravelNews>> fetchTravelNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Giả sử bạn sẽ nhận một danh sách JSON
        List jsonResponse = json.decode(response.body);

        // Chuyển JSON thành đối tượng `TravelNews` bằng cách sử dụng phương thức `fromJson`
        return jsonResponse.map((news) => TravelNews.fromJson(news)).toList();
      } else {
        throw Exception('Failed to load travel news');
      }
    } catch (e) {
      throw Exception('Error fetching travel news: $e');
    }
  }
}
