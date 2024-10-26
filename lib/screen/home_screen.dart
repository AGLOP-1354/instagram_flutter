import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });
}

final feedDataList = [
  FeedData(userName: 'Ethan', likeCount: 50, content: '집가고 싶다.'),
  FeedData(userName: 'Taero', likeCount: 12, content: '집가고 싶다.'),
  FeedData(userName: 'Tomo', likeCount: 76, content: '집가고 싶다.'),
  FeedData(userName: 'Aden', likeCount: 0, content: '집가고 싶다.'),
  FeedData(userName: 'Eloy', likeCount: 50, content: '집가고 싶다.'),
  FeedData(userName: 'Jenny', likeCount: 50, content: '집가고 싶다.'),
  FeedData(userName: 'Nana', likeCount: 50, content: '집가고 싶다.'),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            UserStory(userName: 'Ethan'),
            UserStory(userName: 'Taero'),
            UserStory(userName: 'Tomo'),
            UserStory(userName: 'Aden'),
            UserStory(userName: 'Eloy'),
            UserStory(userName: 'Jenny'),
            UserStory(userName: 'Nana'),
          ],
        ));
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade300,
                  ),
                ),
                const SizedBox(width: 8),
                Text(feedData.userName),
              ],
            ),
            Icon(Icons.more_vert),
          ]),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bookmark),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: feedData.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: feedData.content,
                ),
              ],
              style: const TextStyle(color: Colors.black)
            ),
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
