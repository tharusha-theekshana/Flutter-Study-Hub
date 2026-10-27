import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../services/post_service.dart';
import '../widgets/post_list.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Future<List<Post>> _posts;
  final PostService _apiService = PostService(
    http.Client(),
  );

  @override
  void initState() {
    super.initState();
    _posts = _apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Posts Available'));
          } else {
            return PostList(posts: snapshot.data!);
          }
        },
      ),
    );
  }
}