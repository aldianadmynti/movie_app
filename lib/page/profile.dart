import 'package:flutter/material.dart';
import 'package:movie_app/service/api_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   radius: 50,
            //   backgroundImage: NetworkImage(
            //       "https://www.pngplay.com/wp-content/uploads/6/Film-Icon-Background-PNG-Image.png"),
            // ),
            SizedBox(height: 16),
            Text(
              'Dienzzz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'tiime.t0watching@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Malang, Indonesia'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+62 838 9925 7090'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Joined on December 1, 2023'),
            ),
          ],
        ),
      ),
    );
  }
}
