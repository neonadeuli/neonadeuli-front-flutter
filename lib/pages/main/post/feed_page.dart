import 'package:flutter/material.dart';
import 'package:neonadeuli_front_flutter/widgets/post.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Post(
            postId: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 3,
              color: Colors.orange[200],
            ),
          ),
          const Post(
            postId: 2,
          ),
        ],
      ),
    );
  }
}
