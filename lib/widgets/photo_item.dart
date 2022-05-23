import 'package:flutter/material.dart';

import '../screens/photo_detail_screen.dart';

class PhotoItem extends StatelessWidget {
  final int id;
  final String title;
  final String picture;

  const PhotoItem(
    {
      required this.id,
      required this.title,
      required this.picture,
      Key? key
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PhotoDetailScreen.routeName, arguments: id);
            },
            child: Hero(
              tag: id,
              child: FadeInImage(
                image: NetworkImage(picture),
                fit: BoxFit.cover,
                placeholder: const NetworkImage('https://www.inlinefs.com/wp-content/uploads/2020/04/placeholder.png'),
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(title, textAlign: TextAlign.center,),
          ),
        ),
      );
  }
}