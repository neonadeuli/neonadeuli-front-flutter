import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neonadeuli_front_flutter/pages/post_detail_page.dart';

class Post extends StatelessWidget {
  final int postId;

  const Post({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 40,
            ),
            SizedBox(
              width: 5,
            ),
            Text('eora21')
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      "https://media.discordapp.net/attachments/1193853621197086765/1199293754054545428/KakaoTalk_20240123_185826476_03.jpg?ex=65c20458&is=65af8f58&hm=420059aefd877e9b98ef885aaee012abd587eded6805e01d6c49cb33e133a02d&=&format=webp&width=514&height=686",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.thumb_up_alt_rounded)),
            const Text('32'),
            IconButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetail(
                            postId: postId,
                          ),
                        ),
                      )
                    },
                icon: const Icon(Icons.comment_rounded)),
            const Text('11'),
          ],
        ),
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
        )
      ],
    );
  }
}
