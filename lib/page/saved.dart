import 'package:flutter/material.dart';

import '../widget/list_poster.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Saved',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(height: 8),
            ListPosterMovie(listMovie: []),
          ],
        ));
  }
}
