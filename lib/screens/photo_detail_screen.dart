import 'package:flutter/material.dart';

import '../models/photo.dart';

class PhotoDetailScreen extends StatelessWidget {
  static const routeName = '/photo-detail';

  const  PhotoDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)?.settings.arguments as Photo;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(photo.title),
              background: Hero(
                tag: photo.id,
                child: Image.network(photo.picture, fit: BoxFit.cover,),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}