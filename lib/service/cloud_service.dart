import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:movie_app/model.dart/movie_poster_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CloudService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final SharedPreferences _pref;

  CloudService({required SharedPreferences pref}) : _pref = pref;

  Future<void> saveMovie(MoviePosterModel model) async {
    await _db
        .collection('dataUser')
        .doc(_pref.getString('uid'))
        .collection('savedMovie')
        .doc(model.id.toString())
        .set(model.toJson());
  }

  Stream<QuerySnapshot<Object?>> getSavedMovie() {
    return _db
        .collection('dataUser')
        .doc(_pref.getString('uid'))
        .collection('savedMovie')
        .snapshots();
  }
}
