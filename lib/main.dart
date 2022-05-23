import 'package:flutter/material.dart';

import './screens/photo_list_screen.dart';
import './screens/photo_detail_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photos",
      home: AuthScreen(),
      routes: {
        PhotoDetailScreen.routeName: (ctx) => const PhotoDetailScreen(),
        PhotoListScreen.routeName: (ctx) => const PhotoListScreen()
      }
    );
  }
}