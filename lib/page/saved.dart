import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/model.dart/movie_poster_model.dart';
import 'package:movie_app/service/cloud_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../injection_container.dart';
import '../widget/list_poster.dart';

class SavedPage extends StatefulWidget {
  SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  CloudService _service = sl();

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
            StreamBuilder(
              stream: _service.getSavedMovie(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot<Object?>> queryDoc =
                        snapshot.data!.docs;

                    var data = queryDoc
                        .map((e) => MoviePosterModel.fromDocSnap(e))
                        .toList();
                    return ListPosterMovie(listMovie: data);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              },
            ),
          ],
        ));
  }
}
