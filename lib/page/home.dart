import 'package:flutter/material.dart';
import 'package:movie_app/model.dart/movie_poster_model.dart';
import 'package:movie_app/service/api_service.dart';

import '../widget/list_poster.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;
  final _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currIndex,
      length: 10,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(height: 24),
            Text(
              'Hi, Andien!',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Watch your favorite movies here',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 18),
              labelPadding: EdgeInsets.all(16),
              indicatorColor: Colors.black,
              onTap: (value) {
                setState(() {
                  currIndex = value;
                  print('currentIndex $currIndex');
                });
              },
              tabs: [
                Text('Trending Movies'),
                Text('New Movies'),
                Text('Best Animation Movies'),
                Text('Movies you can watch for Free'),
                Text('Famility Time'),
                Text('Most Trending Shows'),
                Text('New Shows'),
                Text('Get a shot of adrenaline'),
                Text('Sci-Fi TV'),
                Text('Docuseries'),
              ],
            ),
            SizedBox(height: 24),
            FutureBuilder(
                future: _service.homePost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListPosterMovie(
                      listMovie: snapshot.data![currIndex],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
