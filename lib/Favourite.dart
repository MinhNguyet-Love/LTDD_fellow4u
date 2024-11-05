// favourite.dart
import 'package:flutter/material.dart';
import 'favourite_news.dart'; // Import your model class
import 'favourite_news_service.dart';
class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late Future<List<TravelNews1>> futureTravelNews; // Ensure this is correctly defined

  @override
  void initState() {
    super.initState();
    futureTravelNews = TravelNewsService().fetchTravelNews(); // This must match the type
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
      body: FutureBuilder<List<TravelNews1>>(
        future: futureTravelNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available'));
          }

          // Display the news items
          List<TravelNews1> travelNewsList = snapshot.data!;
          return ListView.builder(
            itemCount: travelNewsList.length,
            itemBuilder: (context, index) {
              final newsItem = travelNewsList[index];
              return ListTile(
                leading: Image.network(newsItem.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(newsItem.title),
                subtitle: Text(newsItem.date),
              );
            },
          );
        },
      ),
    );
  }
}
