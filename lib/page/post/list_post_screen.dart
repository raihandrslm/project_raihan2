import 'package:flutter/material.dart';
import 'package:project_raihan2/models/post_model.dart';
import 'package:project_raihan2/services/post_service.dart';
import 'package:project_raihan2/page/post/detail_post_screen.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Posts'),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<PostModel>>(
        future: PostService.listPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final posts = snapshot.data ?? [];

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                leading: Hero(
                  tag: 'post-${post.id}',
                  child: Image.network(
                    post.thumbnailUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(post.title),
                subtitle: Text('Album ID: ${post.albumId}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailScreen(post: post),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
