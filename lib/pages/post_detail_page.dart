import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final int postId;

  const PostDetail({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글 자세히 보기'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(
              tag: 'post$postId',
              child: Material(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('메롱')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
