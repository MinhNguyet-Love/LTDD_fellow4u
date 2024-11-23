// lib/tour_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
// Sample usage in your TourService

import 'tour_news.dart'; // Import your Tour model

class TourService {
  final String apiUrl = 'https://server-api-opqn.onrender.com/tour-news/api'; // Update with your API URL

  Future<List<Tour>> fetchTours() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((tour) => Tour.fromJson(tour)).toList();
    } else {
      throw Exception('Failed to load tours');
    }
  }
}

