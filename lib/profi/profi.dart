import 'package:flutter/material.dart';
import 'package:flutter_application_1_fellow4u_1/favourite/Favourite.dart';
import 'package:flutter_application_1_fellow4u_1/chat/chat_mess.dart';
import 'package:flutter_application_1_fellow4u_1/mytrips/mytrip.dart';
import 'package:flutter_application_1_fellow4u_1/search.dart';


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
                // Điều hướng đến trang Home
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.my_location_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurrentTripsPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouritePage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  // Phương thức để tạo header (ví dụ)
  Widget _buildHeader() {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(child: Text('Explore Header')),
    );
  }

  // Phương thức để tạo tiêu đề cho các section (ví dụ)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Các phần như danh sách hành trình (ví dụ)
  Widget _buildJourneyList() {
    return Container(
      height: 100,
      color: Colors.red,
      child: Center(child: Text('Journey List')),
    );
  }

  Widget _buildBestGuidesSection() {
    return Container(
      height: 100,
      color: Colors.green,
      child: Center(child: Text('Best Guides Section')),
    );
  }

  Widget _buildTopExperienceSection() {
    return Container(
      height: 100,
      color: Colors.orange,
      child: Center(child: Text('Top Experience Section')),
    );
  }

  Widget _buildFeaturedToursSection() {
    return Container(
      height: 100,
      color: Colors.purple,
      child: Center(child: Text('Featured Tours Section')),
    );
  }

  Widget _buildTravelNewsSection() {
    return Container(
      height: 100,
      color: Colors.yellow,
      child: Center(child: Text('Travel News Section')),
    );
  }
}


class ProPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Loại bỏ thanh AppBar
        child: Container(), // Không hiển thị AppBar, chỉ để không gian
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Background Image and Profile
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/nen profile.png'), // Đường dẫn ảnh nền
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/1.jpg'), // Đường dẫn ảnh đại diện
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yoo Jin',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'yoojinn@gmail.com',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Nút setting nằm trên hình nền
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: Icon(Icons.settings, color: Colors.black, size: 30),
                    onPressed: () {
                      // Cài đặt
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // My Photos Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Photos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPhoto('assets/images/Mask Group.png'),
                  _buildPhoto('assets/images/Mask Group 3.png'),
                  _buildPhoto('assets/images/Mask Group 2.png'),
                  _buildPhoto('assets/images/Mask Group 4.png'),
                ],
              ),
            ),
            SizedBox(height: 16),

            // My Journeys Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'My Journeys',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            _buildJourneyCard(
              'A memory in Danang',
              'Danang, Vietnam',
              'Jan 20, 2020',
              'assets/images/Mask Group 5.png',
              234,
            ),
            _buildJourneyCard(
              'Sapa in spring',
              'Sapa, Vietnam',
              'Jan 20, 2020',
              'assets/images/Mask Group 6.png',
              234,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildJourneyCard(String title, String location, String date, String imagePath, int likes) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề và dấu ba chấm nằm trong cùng một Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Phân bố khoảng cách đều giữa tiêu đề và dấu ba chấm
                    children: [
                      Expanded(
                        child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      Icon(Icons.more_vert), // Dấu ba chấm
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.teal),
                      SizedBox(width: 4),
                      Text(location),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Phân phối các phần tử đều trên chiều ngang
                    children: [
                      Text(date, style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: 16),
                          SizedBox(width: 4),
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
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // Model UserProfile
// class UserProfile {
//   final String name;
//   final String email;
//   final String avatarUrl;

//   UserProfile({required this.name, required this.email, required this.avatarUrl});

//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//       name: json['name'],
//       email: json['email'],
//       avatarUrl: json['avatarUrl'],
//     );
//   }
// }

// // Widget ProPage
// class ProPage extends StatefulWidget {
//   @override
//   _ProPageState createState() => _ProPageState();
// }

// class _ProPageState extends State<ProPage> {
//   late Future<UserProfile> futureUserProfile;

//   // Hàm fetchUserProfile lấy dữ liệu từ API
//   Future<UserProfile> fetchUserProfile() async {
//     final response = await http.get(Uri.parse('https://your-api.com/profile'));

//     if (response.statusCode == 200) {
//       return UserProfile.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load profile data');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     futureUserProfile = fetchUserProfile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(0),
//         child: Container(),
//       ),
//       body: FutureBuilder<UserProfile>(
//         future: futureUserProfile,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('No profile data available'));
//           }

//           final userProfile = snapshot.data!;
//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/nen profile.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 16,
//                       left: 16,
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundImage: NetworkImage(userProfile.avatarUrl),
//                           ),
//                           SizedBox(width: 16),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 userProfile.name,
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 userProfile.email,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: 16,
//                       right: 16,
//                       child: IconButton(
//                         icon: Icon(Icons.settings, color: Colors.black, size: 30),
//                         onPressed: () {
//                           // Xử lý sự kiện bấm vào nút cài đặt
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'My Photos',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         height: 100,
//                         color: Colors.grey[200],
//                         child: Center(child: Text("Photos section placeholder")),
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         'My Journeys',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         height: 100,
//                         color: Colors.grey[200],
//                         child: Center(child: Text("Journeys section placeholder")),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
