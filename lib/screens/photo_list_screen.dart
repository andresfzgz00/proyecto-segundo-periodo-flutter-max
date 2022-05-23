import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/photo.dart';
import '../widgets/photo_item.dart';


class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  var _isLoading = false;
  var _isInit = true;
  List<Photo> _photos = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
    }
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
      http.get(url).then((response) {
        final decodedResponse = jsonDecode(response.body) as List<Map<String, dynamic>>;
        _photos = decodedResponse.sublist(0, 5).map((e) => Photo(id: e["id"], title: e["title"], picture: e["picture"])).toList();
      });
    } catch (error) {
    }
    setState(() {
      _isInit = false;
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator(),) : GridView.builder(
        
        padding: const EdgeInsets.all(10),
        itemCount: _photos.length,
        itemBuilder: (ctx, i) => PhotoItem(id: _photos[i].id, title: _photos[i].title, picture: _photos[i].picture),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
      ),
    );
  }
}