import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recenth_posts/src/logic/services/location_service/local_storage_service.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await LocalStorageService.setInt('currentIndex', 0);
  runApp(const RecenthPosts());
}
