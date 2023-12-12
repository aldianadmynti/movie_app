import 'package:flutter/material.dart';
import 'package:movie_app/service/api_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _service = ApiService();

  @override
  Widget build(BuildContext context) {
    void printData() async {
      var data = await _service.getDetail(27205);
      print(data.tittle);
      print(data.genre);
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text('klik'),
            onPressed: () {
              printData();
            }),
      ),
    );
  }
}
