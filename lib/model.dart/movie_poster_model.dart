import 'package:cloud_firestore/cloud_firestore.dart';

class MoviePosterModel {
  final int? id;
  final String? urlPoster;

  MoviePosterModel({required this.id, required this.urlPoster});

  factory MoviePosterModel.fromDocSnap(DocumentSnapshot json) {
    return MoviePosterModel(
      id: json['_id'],
      urlPoster: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'poster_path': urlPoster,
    };
  }
}
