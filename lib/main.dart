import 'package:flutter/material.dart';
import 'package:recenth_posts/src/logic/repository/auth/csfr_token_repo.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CSFRTokenRepo csfrTokenRepo = CSFRTokenRepo();
  if (await csfrTokenRepo.getToken()) {
    runApp(const MainApp());
  }
  runApp(const MainApp());
}
