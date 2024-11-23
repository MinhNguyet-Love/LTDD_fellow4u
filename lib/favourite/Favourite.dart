import 'package:flutter/material.dart';
import 'package:flutter_application_1_fellow4u_1/chat/chat_mess.dart';
import 'package:flutter_application_1_fellow4u_1/home.dart';
import 'package:flutter_application_1_fellow4u_1/mytrips/mytrip.dart';
import 'package:flutter_application_1_fellow4u_1/profi/profi.dart';
import 'package:flutter_application_1_fellow4u_1/search.dart';
import 'favourite_news.dart'; // Import your model class
import 'favourite_news_service.dart'; // Import your service for fetching news

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late Future<List<TravelNews1>> futureTravelNews;

  @override
  void initState() {
    super.initState();
    futureTravelNews = TravelNewsService().fetchTravelNews(); // This fetches the news
  }

  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildBackgroundImage('assets/images/Mask Group.png', 200),
        Positioned(
          top: 20,
          left: 16,
          child: Text(
            "My Trips",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 16,
          child: _buildWeatherInfo(),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage(String imageUrl, double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildWeatherInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Da Nang",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(Icons.cloud, color: Colors.white, size: 20),
            SizedBox(width: 5),
            Text("26°C", style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
      body: Column(
        children: [
          _buildHeader(), // Add the header here
          Expanded(
            child: FutureBuilder<List<TravelNews1>>(
              future: futureTravelNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No news available'));
                }

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
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextHome())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.my_location_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentTripsPage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavouritePage())
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProPage())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
