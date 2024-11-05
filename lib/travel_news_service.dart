// lib/travel_news_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'travel_news.dart';

class TravelNewsService {
  final String apiUrl = 'https://server-api-opqn.onrender.com/travel-news';

  Future<List<TravelNews>> fetchTravelNews() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => TravelNews.fromJson(news)).toList();
    } else {
      throw Exception('Failed to load travel news');
    }
  }
}
