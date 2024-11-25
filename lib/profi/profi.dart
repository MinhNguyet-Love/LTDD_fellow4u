import 'package:flutter/material.dart';
import 'package:flutter_application_1_fellow4u_1/chat/chat_mess.dart';
import 'package:flutter_application_1_fellow4u_1/favourite/Favourite.dart';
import 'package:flutter_application_1_fellow4u_1/home.dart';
import 'package:flutter_application_1_fellow4u_1/mytrips/mytrip.dart';
import 'package:flutter_application_1_fellow4u_1/search.dart';

class ProPage extends StatefulWidget {
  @override
  _ProPageState createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> {
  int _selectedIndex = 5; // Mục được chọn mặc định (Profile Page)

  final List<Widget> _pages = [
    NextHome(), // Trang Home
    SearchPage(), // Trang Search
    CurrentTripsPage(), // Trang Trips
    NotificationPage(), // Trang Chat
    FavouritePage(), // Trang Favourite
    ProPageContent(), // Nội dung của Profile Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]), // Đảm bảo không chồng UI
      bottomNavigationBar: _selectedIndex == 5 // Chỉ hiển thị bottom bar khi ở trang Profile
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.my_location),
                  label: 'Trips',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            )
          : null, // Không hiển thị bottom bar nếu không phải trang Profile
    );
  }
}

class ProPageContent extends StatefulWidget {
  @override
  _ProPageContentState createState() => _ProPageContentState();
}

class _ProPageContentState extends State<ProPageContent> {
  // Biến lưu trạng thái "thích" cho từng mục
  List<bool> _isLiked = [false, false]; // Giả sử có 2 mục ở đây

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Các phần trên giao diện như profile, ảnh...
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'My Photos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildPhoto('assets/images/Mask Group.png', 0),  // Truyền vào chỉ số
                _buildPhoto('assets/images/Mask Group 3.png', 1), 
                 // Truyền vào chỉ số
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'My Journeys',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          _buildJourneyCard(
            'A memory in Danang',
            'Danang, Vietnam',
            'Jan 20, 2020',
            'assets/images/Mask Group 5.png',
            234,
            0,  // Chỉ số của mục
          ),
          _buildJourneyCard(
            'Sapa in spring',
            'Sapa, Vietnam',
            'Jan 20, 2020',
            'assets/images/Mask Group 6.png',
            234,
            1,  // Chỉ số của mục
          ),
        ],
      ),
    );
  }

  // Hàm tạo widget ảnh
  Widget _buildPhoto(String imagePath, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: IconButton(
        icon: Icon(
          _isLiked[index] ? Icons.favorite : Icons.favorite_border,
          color: _isLiked[index] ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _isLiked[index] = !_isLiked[index]; // Chỉ thay đổi trạng thái của mục này
          });
        },
      ),
    );
  }

  // Hàm tạo widget card cho các chuyến đi
  Widget _buildJourneyCard(String title, String location, String date, String imagePath, int likes, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: Icon(
                          _isLiked[index] ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked[index] ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLiked[index] = !_isLiked[index]; // Chỉ thay đổi trạng thái của mục này
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.teal),
                      const SizedBox(width: 4),
                      Text(location),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date, style: const TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: 16),
                          const SizedBox(width: 4),
                          Text('$likes Likes'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
