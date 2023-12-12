import 'package:flutter/material.dart';
import 'package:movie_app/model.dart/movie_model.dart';
import 'package:movie_app/model.dart/movie_poster_model.dart';
import 'package:movie_app/service/api_service.dart';

import '../widget/list_poster.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final searchController = TextEditingController();

  final service = ApiService();

  List<MoviePosterModel> list = [];

  void getList(query) async {
    list = await service.search(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 24),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Cari Judul',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onSubmitted: (value) {
              getList(value);
              setState(() {});
            },
          ),
          SizedBox(height: 24),
          ListPosterMovie(listMovie: list),
        ],
      ),
    );
  }
}
