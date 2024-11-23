import 'package:flutter/material.dart';
import 'package:flutter_application_1_fellow4u_1/tour/tour_news.dart';
import 'package:flutter_application_1_fellow4u_1/tour/tour_news_service.dart';
import 'package:flutter_application_1_fellow4u_1/travel/travel_news.dart';
import 'package:flutter_application_1_fellow4u_1/travel/travel_news_service.dart';
import 'search.dart';
import 'chat/chat_mess.dart';
import 'favourite/Favourite.dart';
import 'profi/profi.dart';
import 'mytrips/mytrip.dart';


class NextHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplorePage(),
    );
  }
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 60),
              _buildSectionTitle("Top Journeys"),
              _buildJourneyList(),
              SizedBox(height: 60),
              _buildBestGuidesSection(),
              SizedBox(height: 60),
              _buildTopExperienceSection(),
              SizedBox(height: 60),
              _buildFeaturedToursSection(),  
              SizedBox(height: 60),
              _buildTravelNewsSection(),  
            ],
          ),
        ),
      ),
          bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => NextHome())//dieu hương den trang home

                // );
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
  Widget _buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildBackgroundImage('assets/images/Mask Group.png', 200),
        Positioned(
          top: 20,
          left: 16,
          child: Text(
            "Explore",
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
        Positioned(
          left: 16,
          right: 16,
          bottom: -30,
          child: _buildSearchField(),
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

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: "Hi, where do you want to explore?",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildJourneyList() {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          JourneyCard(
            imageUrl: 'assets/images/Mask Group 1.png',
            title: "Da Nang - Ba Na - Hoi An",
            date: "Jan 30, 2020",
            days: "3 days",
            price: "\$400.00",
            likes: 1247,
          ),
          JourneyCard(
            imageUrl: 'assets/images/Mask Group 2.png',
            title: "Thailand",
            date: "Jan 30, 2020",
            days: "3 days",
            price: "\$600.00",
            likes: 1247,
          ),
          JourneyCard(
            imageUrl: 'assets/images/Mask Group 2.png',
            title: "Thailand",
            date: "Jan 30, 2020",
            days: "3 days",
            price: "\$600.00",
            likes: 1247,
          ),
        ],
      ),
    );
  }

  Widget _buildBestGuidesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best Guides", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: Text("See More", style: TextStyle(fontSize: 20, color: Colors.blue))),
            ],
          ),
          SizedBox(
            height: 400, 
            child: GridView.count(
              crossAxisCount: 2, 
              crossAxisSpacing: 30,
              mainAxisSpacing: 50,
              childAspectRatio: 1,
              physics: NeverScrollableScrollPhysics(),
              children: [
                GuideCard(
                  imageUrl: 'assets/images/Tuan.png',
                  name: "Tuan Tran",
                  location: "Danang, Vietnam",
                  reviews: 127,
                ),
                GuideCard(
                  imageUrl: 'assets/images/Emmy.png',
                  name: "Emmy",
                  location: "Hanoi, Vietnam",
                  reviews: 127,
                ),
                GuideCard(
                  imageUrl: 'assets/images/Tuan.png',
                  name: "Another Guide",
                  location: "HCM City, Vietnam",
                  reviews: 102,
                ),
                GuideCard(
                  imageUrl: 'assets/images/Emmy.png',
                  name: "Guide Name",
                  location: "Hue, Vietnam",
                  reviews: 85,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopExperienceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Experiences",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ExperienceCard(
                  imageUrl: 'assets/images/Tuan.png',
                  name: "Tuan Tran",
                  location: "Danang, Vietnam",
                  experience: "Scenic Tours",
                ),
                ExperienceCard(
                  imageUrl: 'assets/images/Emmy.png',
                  name: "Emmy",
                  location: "Hanoi, Vietnam",
                  experience: "Historical Tours",
                ),
                ExperienceCard(
                  imageUrl: 'assets/images/Tuan.png',
                  name: "Another Guide",
                  location: "HCM, Vietnam",
                  experience: "Beach Tours",
                ),
                ExperienceCard(
                  imageUrl: 'assets/images/Emmy.png',
                  name: "Guide Name",
                  location: "Hue, Vietnam",
                  experience: "Cultural Tours",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class JourneyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String days;
  final String price;
  final int likes;

  JourneyCard({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.days,
    required this.price,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset(imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 8,  // Adjust the distance from the bottom
                      left: 8,  // Adjust the distance from the left
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow, size: 16)),
                          ),  // 5 star icons
                          SizedBox(width: 4),
                          Text(
                            "$likes likes",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                          ),                        
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(date),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(days),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              color: Colors.green, // Price color changed to green
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class GuideCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final int reviews;

  GuideCard({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 8, // Adjust position to be at the bottom
                left: 8,
                child: Column(
                  children: [
                    Row(
                      children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow, size: 16)),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "$reviews Reviews",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class ExperienceCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String experience;

  ExperienceCard({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 500,
      margin: EdgeInsets.only(left: 2),
      child: Card(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                'assets/images/Mask Group 3.png', 
                fit: BoxFit.cover,
                width: 206, 
                height: 259, 
              ),
            ),
            Positioned(
              top: 90,
              left: 10,
              child: Container(
                width: 60, // Increased the size for better visibility
                height: 60, 
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 150, 50), // Color of the border (matches screenshot)
                    width: 3.0, // Thickness of the border
                  ),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16, 
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.star, color: Colors.yellow, size: 20),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), 
                  borderRadius: BorderRadius.circular(8), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8, 
                      offset: Offset(0, 4), 
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 16, 
                      ),
                    ),
                    SizedBox(height: 4), 
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.black87, 
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      experience,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildFeaturedToursSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Featured Tours"), // Tiêu đề của phần "Tour Nổi Bật"
        SizedBox(height: 10), // Khoảng cách giữa tiêu đề và danh sách tour
        Container(
          height: 350, // Chiều cao của vùng chứa tour
          child: FutureBuilder<List<Tour>>(
            future: TourService().fetchTours(), // Gọi dịch vụ để lấy dữ liệu tour từ MongoDB
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Hiển thị biểu tượng tải khi đang chờ dữ liệu
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'), // Hiển thị thông báo lỗi nếu có
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No tours available.')); // Hiển thị thông báo nếu không có tour
              } else {
                final tourList = snapshot.data!; // Lấy danh sách tour từ dữ liệu
                return ListView.builder(
                  scrollDirection: Axis.vertical, // Hướng cuộn theo chiều dọc
                  itemCount: tourList.length, // Số lượng tour để hiển thị
                  itemBuilder: (context, index) {
                    final tour = tourList[index]; // Lấy tour theo chỉ số
                    return _buildTourCard(
                      imageUrl: tour.imageUrl, // Lấy ảnh từ dữ liệu tour
                      title: tour.title,       // Lấy tiêu đề từ dữ liệu tour
                      date: tour.date,         // Lấy ngày từ dữ liệu tour
                      price: tour.price,       // Lấy giá từ dữ liệu tour
                      days: tour.days,         // Lấy số ngày từ dữ liệu tour
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}


// Widget _buildFeaturedToursSection() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle("Featured Tours"),
//         SizedBox(height: 10),
//         Container(
//           height: 350,
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               _buildTourCard(
//                 imageUrl: 'assets/images/Mask Group 4.png',
//                 title: "Da Nang - Ba Na - Hoi An",
//                 date: "Jan 30, 2020",
//                 price: "\$400.00",
//                 days: "3 days",
//               ),
//               _buildTourCard(
//                 imageUrl: 'assets/images/Mask Group 5.png',
//                 title: "Melbourne - Sydney",
//                 date: "Jun 30, 2020",
//                 price: "\$600.00",
//                 days: "5 days",
//               ),
//               _buildTourCard(
//                 imageUrl: 'assets/images/Mask Group 6.png',
//                 title: "Hanoi - Ha Long Bay",
//                 date: "Jan 28, 2020",
//                 price: "\$300.00",
//                 days: "3 days",
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget _buildTourCard({
  required String imageUrl,
  required String title,
  required String date,
  required String price,
  required String days,
}) {
  // Define a boolean to keep track of the favorite status
  bool _isFavorite = false;

  // Define a function to toggle the favorite status
  void _toggleFavorite() {
    _isFavorite = !_isFavorite;
  }

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                              SizedBox(width: 4),
                              Text(date),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.timer, color: Colors.grey, size: 16),
                              SizedBox(width: 10),
                              Text(days),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            _isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: _isFavorite ? Colors.green : Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              _toggleFavorite();
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        Text(price, style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
Widget _buildTravelNewsSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Travel News"),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: FutureBuilder<List<TravelNews>>(
            future: TravelNewsService().fetchTravelNews(), // Gọi dịch vụ để lấy dữ liệu
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator()); // Hiển thị loading
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}')); // Hiển thị lỗi
              } else {
                final newsList = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return _buildNewsCard(
                      imageUrl: newsList[index].imageUrl, // Lấy ảnh từ dữ liệu
                      title: newsList[index].title, // Lấy tiêu đề từ dữ liệu
                      date: newsList[index].date, // Lấy ngày từ dữ liệu
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildNewsCard({
  required String imageUrl,
  required String title,
  required String date,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(date),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}