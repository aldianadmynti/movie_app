import 'package:get_it/get_it.dart';
import 'package:movie_app/service/cloud_service.dart';
import 'package:movie_app/service/firebase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  final pref = await SharedPreferences.getInstance();

  sl
  ..registerSingleton<FirebaseAuthService>(FirebaseAuthService(prefs: pref))
  ..registerSingleton<CloudService>(CloudService(pref: pref));
}
