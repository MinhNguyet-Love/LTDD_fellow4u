import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.teal,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/avatar.jpg'), // Thay bằng ảnh của bạn
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yoo Jin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Traveler',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Chức năng chỉnh sửa hồ sơ
                      // Điều hướng đến trang Edit Profile
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('EDIT PROFILE'),
                  ),
                ],
              ),
            ),

            // Settings Options
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.black),
              title: Text('Notifications'),
              trailing: Switch(
                value: true,
                onChanged: (bool value) {
                  // Xử lý bật/tắt thông báo
                },
              ),
            ),
            _buildSettingsOption(Icons.language, 'Languages', () {
              // Mở trang chọn ngôn ngữ
            }),
            _buildSettingsOption(Icons.payment, 'Payment', () {
              // Mở trang thanh toán
            }),
            _buildSettingsOption(Icons.security, 'Privacy & Policies', () {
              // Mở trang chính sách bảo mật
            }),
            _buildSettingsOption(Icons.feedback, 'Feedback', () {
              // Mở trang gửi phản hồi
            }),
            _buildSettingsOption(Icons.book, 'Usage', () {
              // Mở trang sử dụng
            }),

            // Sign Out Button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TextButton(
                onPressed: () {
                  // Chức năng đăng xuất
                },
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create setting options
  Widget _buildSettingsOption(IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap: onTap, // Thực hiện chức năng khi người dùng nhấn vào mục
    );
  }
}
